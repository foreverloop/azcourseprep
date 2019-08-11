# %% [markdown]
# I have Covered clustering in more detail in my python clustering notebook. But Here is a nice R library for #fuzzy clustering in R, nicer than anything I could find in python.

# %% [code]
#clustering stuff
library(tidyverse)
library('cluster')
library('factoextra')

# %% [code]
df_pokemon <- read_csv('/kaggle/input/Pokemon.csv')

# %% [code]
head(df_pokemon,4)

# %% [code]
#unordered bar
#ggplot(data = df_pokemon) +
#geom_bar(mapping = aes(x = `Type 1`, fill = `Type 1`))

#ordered bar
ggplot(df_pokemon,aes(x = reorder(`Type 1`,`Type 1`, function(x)-length(x)),fill = `Type 1`)) + 
geom_bar()

# %% [code]
speed_spatk <- select(df_pokemon,`Sp. Atk`,Speed,`Type 1`)
head(speed_spatk,5)

# %% [code]
ggplot(data = speed_spatk) +
geom_point(mapping = aes(x = `Sp. Atk`, y = Speed,color=`Type 1`),position='jitter') +
geom_smooth(aes(x = `Sp. Atk`, y = Speed))

# %% [code]
scaled_pokemon <- scale(speed_spatk)
res.fanny <- fanny(scaled_pokemon,2)

# %% [code]
fviz_cluster(res.fanny,ellipse.type = 'norm',
             repel=FALSE,palette = "jco",
             ggtheme=theme_minimal(),legend="right")

# %% [markdown]
# The fuzzy part of this clustering is the intersection between both sets