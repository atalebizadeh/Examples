### Building a notification system:
In this example, we will be using potholes and illegal dumping backlogs for our notification system.

Potholes and illegal dumping backlogs are growing out of control. The City Council has asked us to help directors know when they're running behind on their work.

We are going to maintain a CSV of directors with their emails, numbers, and department. We will use that list to create subscriptions to the trash_notifications topic we create.

If illegal dumping case count exceeds 30, we will publish to the trash_notifications topic. All the subscribers from contacts.csv will receive it. We will do the same for potholes, with a different topic.

-- Building the notification system:

  First, we will create topics and subscribe users to them based on the contact list.

  Next, we will get the Pothole count and illegal dumping count from the CSV. Finally, if the pothole count exceeds 100, and if illegal dumping exceeds 30, we will send out alerts to the people subscribed to those topics.


First, we initialize the boto3 SNS client. We create a topic for trash and streets notifications. We store their ARNs in a variable for future use. When we re-run the script, we don't have to worry about new topics being created with the same name, since the create_topic command is idempotent.

Next, we need to subscribe users to the topics. We load the contacts.csv into a DataFrame. This file is stored on S3, as we will likely update it often due to requests from directors.

Then, let's subscribe each user's email and phone to their respective department topics. We want bells going off when there's a backlog!

We are going to make a function, subscribe_user, that we will use for every row in the contacts DataFrame. If the department column value for that row is trash, we will subscribe the user's phone number and email to the trash TopicArn. Otherwise, we will subscribe them to the streets TopicArn. We will use the TopicArn variable from the previous create_topic call.

For the email subscriptions to be confirmed, they still have to click the link in the confirmation email.

Now, we need to get last month's aggregated report. Because it's public, we can simply use pd.read_csv to load the report into a DataFrame.

Let's pull out the aggregated numbers. We set the index on service_name for easier access. Then, we use pandas' df.at to get the counts and store them in a variable.

We compare the trash_violations_count value to the threshold we have set. If the threshold is exceeded, we make a message string with the current count of trash violations. Then we publish this message to the trash_notifications topic. We also include the Subject so that e-mail subscribers will see "Trash Alert" as their email subject.

We repeat with the streets violations which have a different threshold. We send the message to the streets_notifications topic if the threshold is exceeded.

The final result is a notification system that is able to analyze data and send alerts to users that can act on it. If we set this job to run on a schedule, along with our scheduled reports, we can trigger alerts at different thresholds for different people to act on the information as it becomes available.

Combining disparate pieces of data movement to serve a purpose, and converting data to actionable information is the core of data engineering.
