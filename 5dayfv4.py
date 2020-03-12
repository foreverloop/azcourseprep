"""
produces histograms showing an approximation of a continuous distribution 
for the probability of rain over the next 24 hours, with a graph for the next 5 days

Contains public sector information licensed under the Open Government Licence
"""
import requests,json,csv,ast,numpy
from matplotlib import pyplot as plt
plt.style.use('ggplot')

with open("endpoint.csv","r") as f:
  reader = csv.reader(f,delimiter=',')
  for row in reader:
    endpoint = row[0]

def plot_temp_graph(graphno,obs_time,temp_time):
  if graphno > 5:
    return #required since plt.subplot expects 1+ in subplot not 0
  ax = plt.subplot(3,2,graphno)
  
  plt.plot(obs_time,temp_time,color='orange')
  #plt.title("Day %d" % graphno)
  plt.axis([0,24,min(temp_time) - 2,max(temp_time) + 2])

  if graphno == 5:
    plt.xlabel("Observation time (24H)")
    plt.ylabel("temperature (C)")

    #graphs coming out weird because the axis
    #only works for one metric at a time
    plt.show()

def make_rain_graph(graphno,obs_time,rain_chance):
  
  if graphno > 5:
    return #this is only a 5 day forecast	

  ax = plt.subplot(3,2,graphno)

  plt.bar(obs_time,rain_chance,width=len(obs_time))
  #plt.title("Day %d" % graphno)
  plt.axis([0,24,0,100])
  if graphno == 5:
    plt.xlabel("Observation time (24H)")
    plt.ylabel("rain (%) chance")

    #graph looks weird because it only works
    #for one metric at a time
    plt.show()

saved_forecasts = list()
temperatures = list()
rain_chance_percent = list()
signif_weather = list()
obs_taken = list()

print("update from server? y/n")
update = input()
while update != "y" and update != "n":
  print("only 'y' or 'n' are allowed. ")
  update = input()

if update == "n":
  print("use which existing file?")
  existing_file = input()
  with open(existing_file,"r") as f:
    reader = csv.reader(f,delimiter=',')
    for row in reader:
      saved_forecasts.append(row)
else:    
  five_day_forecast = json.loads(requests.get(endpoint).text)
  print(five_day_forecast)
  print("data refreshed from server. enter a file name:")
  with open(input(),'w') as f:
    writer = csv.writer(f,delimiter=',')
    for forecast in five_day_forecast["SiteRep"]["DV"]["Location"]["Period"]:
	    writer.writerow([forecast])

	    #unhappy about how hacky this had to get 
	    #but that's the trade off to not be calling the server too much
	    saved_forecasts.append([str(forecast)])

"""
saved_forecasts now populated and ready to extract data from
"""
for idx,forecast in enumerate(saved_forecasts):
  
  #now refers to the 5 day forecast temps, not overall
  five_temperatures = []
  rain_chance_percent = []
  obs_taken = []

  for rep in ast.literal_eval(forecast[0])["Rep"]:
    print(rep)
    temperatures.append(float(rep["F"]))
    five_temperatures.append(float(rep["F"]))
    rain_chance_percent.append(float(rep["Pp"]))
    signif_weather.append(float(rep["W"]))
    obs_taken.append(int(rep["$"]) / 60)
    print(rep["$"])

  make_rain_graph(idx+1,obs_taken,rain_chance_percent)

  #plot_temp_graph(idx+1,obs_taken,five_temperatures)

"""
print "print Temperature Summary stats? y/n"

if raw_input() == "y":
  print "Temperature Summary Statistics"
  print "Mean: ", sum(temperatures) / len(temperatures)
  print "Standard Deviation: ", numpy.std(temperatures)
  print "Variance: ", numpy.std(temperatures) ** 2
  print "Min: ", min(temperatures)
  print "Max: ", max(temperatures)
"""
