**1. Overview:**
Water is critical to a country’s development, as it is not only used in agriculture but also for industrial development. Whether it’s a drink from the tap, a toilet that works, or a place to wash our hands, having water is a basic necessity that many of us take for granted. But in many parts of the world, women and children spend more than four hours walking for water each day. 
Some African countries like Tanzania have large water resources, but they still face the dilemmas where many areas have no reliable access to clean water because these resources are distributed unevenly. During the dry season, which usually lasts from June to October, even large rivers can dry up or their flow declines substantially. 
In this project, we will use Machine Learning methods to help the Government of Tanzania with predicting which pumps are most likely to stop working so they can be prepared for the pump failure in advance. A smart understanding of which waterpoints will fail can improve maintenance operations and ensure that clean, potable water is available to communities across Tanzania and the results of this project will aid the maintenance, process and costs.
The Random Forest model is able to predict **85%** of the pump statuses correctly and the results of this model can be used to skip checking the functional pumps manually throughout Tanzania which would save us **$1,446,300** using a **90% functional rate** that can be used to lower the cost of the faulty pumps replacements in the future. If a pump is non functional, it requires immediate attention as the population dependent on that water source cannot access clean water.‬

**1.1 Problem Statement:**
Hand-driven and gravity fed pumps are still a main source of potable water in Tanzania and the maintenance of these pumps is an ongoing issue. Because many communities either don't have the funds or the knowledge to maintain these pumps, they're constantly breaking! The purpose of this challenge is to predict which pumps will not be functional or need repair in the future, in order to expedite the process of locating, examining, and fixing the pumps.

**2. Data:**
Our approach is to find those features which would be important in predicting the functional status of a pump. For example, the location and the population around any particular water point might play a vital role in the status of that water point. The quantity and construction year for any particular water pump would play a critical role in determining the status of that water pump. There are some features with missing values and we need to decide whether to drop that feature, fill the missing values with the mean and median, or to assign them to the ‘unknown’ category.  

**2.1 Dataset Description:**
The data is provided to us by Taarifa and the Tanzanian Ministry of Water. This dataset contains 59,400 data points and 41 features.

**2.2 Data Cleaning:**
We assume that the data of the water pumps were collected using handheld sensors, paper reports, and via cell phones so many of the feature values were not accurate or have missing values.
There are some features with missing values. The most noticeable features with missing values are ‘construction_year’, ‘gps_height’, ’population’, ‘amount_tsh’, ’latitude’ and ‘longitude’. For example, you can see that approximately 35% of the ‘construction_year’ feature contains 0 (20709 rows) . We also have 36% (21,381 rows) of ‘population’ with the value of 0 and 12% of this feature with the value of 1. For other features like ‘amount_tsh’, we have about 70% of rows with the value of 0 and ‘gps_height’ feature with 34.5% of rows with the value of 0.
We need to be deciding whether to drop them, fill the missing values with the mean and median based on the region they are in, or to assign them to a ‘Missing’ or ‘Unknown’ category.

![](Docs/Pump%20Savings%20-%20With%20Model%20and%20No%20Model.JPG)



