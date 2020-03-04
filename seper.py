import pandas as pd

#df_header = pd.read_csv('header_only.csv')
df_header = pd.read_csv('chronic_disease.csv')

#print(len(df_header)) circa 815,000 rows
#df_c = df_header.loc[df_header['YearStart'] > 2009]
#print(len(df_c))
#print(df_c.head())
#print(df_header['Topic'].value_counts())

#get final entry
"""
df_header['final_response'] = df_header['Question'].apply(lambda x: x.split(',')[len(x.split(',')) - 1])
"""
print(df_header['DataSource'].value_counts())

#tag on the real response
#df_header['final_response'] = df_header['Question'].apply(lambda x: x.split(',',1)[1])

#tidy up Question, since we got our response now
#df_header['Question'] = df_header['Question'].apply(lambda x: x.split(',',1)[0])

#df_header.to_csv('chronic_cleaned.csv')