import seaborn as sns
import matplotlib.pyplot as plt
from shiny import App, render, ui

faithful = sns.load_dataset("geyser")
x = faithful.waiting

app_ui = ui.page_fixed(
    ui.panel_title("Old Faithful"),
    ui.output_plot(id = "histogram"),
    ui.input_slider(
            id="n", 
            label="Number of bins:", 
            min=1, 
            max=50, 
            value=25,
            ticks=True
    ),
)

def server(input, output, session):
    @render.plot(alt="Histogram of waiting times")
    def histogram():
        plt.hist(
            x, 
            bins = input.n(), 
            density=False, 
            color="#BB74DB",
            edgecolor="white")
        plt.title("Histogram of waiting times")
        plt.xlabel("Waiting time to next eruption [mins]")
        plt.ylabel("Frequency")

app = App(ui = app_ui, server = server)
