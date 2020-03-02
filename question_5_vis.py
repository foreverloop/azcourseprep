import pandas as pd
from matplotlib import pyplot as plt

df_years = pd.read_csv('question_5.txt', delimiter='\t')
year_list = df_years['year'].unique()

#consider a folium/plotly state heatmap. But the problem is the heat will be uniform mostly.
for year in year_list:
	df_plot = df_years.loc[df_years['year'] == year]
	plt.bar(df_plot['LocationDesc'],df_plot['count'])
	plt.title("Studies for The Year {0} by State".format(year))
	plt.show()