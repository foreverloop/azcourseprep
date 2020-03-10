import requests,json,csv
from matplotlib import pyplot as plt

#required for security, so I'm not sharing my key on github
with open("endpoint.csv","r") as f:
  reader = csv.reader(f,delimiter=',')
  for row in reader:
    endpoint = row[0]

wreports = json.loads(requests.get(endpoint).text)

def plot_temp_graph(graphno,obs_time,temp_time,snow):
    if graphno > 5:
      return #required since plt.subplot index must start at 1 not 0
    ax = plt.subplot(3,2,graphno)

    #if the intersection of both sets is empty, it returns true
    if not set(range(22,28)).isdisjoint(snow):
      plt.plot(obs_time,temp_time,color='red')
    else:
      plt.plot(obs_time,temp_time,color='blue')

    plt.axis([0,24,min(temp_time) - 2,max(temp_time) + 2])

    if graphno == 5:
      plt.xlabel("Observation time (24H)")
      plt.ylabel("temperature (C)")
      plt.suptitle("5 Day Temperature Forecast")
      plt.show()

#wreports = metadata + reports. but we only care about the reports
for idx,all_reports in enumerate(wreports["SiteRep"]["DV"]["Location"]["Period"]):
	
  obs_time = []
  snow_predicted = []
  temperatures = []
	#all is a list of weather reports, so must nest this
  for report in all_reports["Rep"]:
    snow_predicted.append(report["W"] if report["W"] in range(22,28) else 0)
    obs_time.append(int(report["$"]) / 60)
    temperatures.append(float(report["F"]))
  plot_temp_graph(idx+1,obs_time,temperatures,snow_predicted)
  print(snow_predicted)