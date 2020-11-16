Walt Disney Studios is the foundation on which The Walt Disney Company was built. The Studios has produced more than 600 films since their debut film, Snow White and the Seven Dwarfs in 1937. While many of its films were big hits, some of them were not. In this notebook, we will explore a dataset of Disney movies and analyze what contributes to the success of Disney movies.

The data contains 579 Disney movies with six features: movie title, release date, genre, MPAA rating, total gross, and inflation-adjusted gross.

**The top 10 Disney movies that have earned the most at the box office:**

![](docs/top10.JPG)


**Genre Popularity Trend:**

![](docs/GenrePopularityTrend.JPG)

For Disney movies, Action and Adventure genres are growing the fastest. 


**Should Disney studios make more action and adventure movies?**

We will build a linear regression model to understand the relationship between genre and box office gross. From the regression model, we can check the effect of each genre by looking at its coefficient given in units of box office gross dollars. We will focus on the impact of action and adventure genres here. We will compute 95% confidence intervals for the intercept and coefficients. The 95% confidence intervals for the intercept a and coefficient bi means that the intervals have a probability of 95% to contain the true value a and coefficient bi respectively. If there is a significant relationship between a given genre and the adjusted gross, the confidence interval of its coefficient should exclude 0.

The confidence intervals from the bootstrap method for the intercept and coefficient do not contain the value zero, as we have already seen that lower and upper bounds of both confidence intervals are positive. These tell us that it is likely that the adjusted gross is significantly correlated with the action and adventure genres.

From the results of the bootstrap analysis and the trend plot we have done earlier, we could say that Disney movies with plots that fit into the action and adventure genre, according to our data, tend to do better in terms of adjusted gross than other genres. So we could expect **more Marvel, Star Wars, and live-action movies in the upcoming years!**
