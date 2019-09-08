#linear regression by hand, deliberately I am aware of glm() method


scatter <- ggplot(cancer_data, aes(radius_mean, smoothness_mean)) + geom_point(color = "#606060") + geom_smooth(method=lm, color="#608793", se=FALSE) + labs(x = "Radius Mean", y = "Smoothness Mean")

scatter_with_marg <- ggExtra::ggMarginal(scatter, color = "#606060", 
                                         fill = "#606060", type = "histogram")
scatter_with_marg