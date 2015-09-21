## Prospects

### Overview

The goal of this project is to facilite the sales effort by maintaining the state of a list of prospects.
This will let sales answer couple of questions:

* Who should I be contacting next?
* How effective are my sales strategies?

The first question will be answered by maintaining a prioritized list of our prospects.
The second question will probably involve campaign analytics.

### Prospects

There are two main ways we plan on doing sales: cold calling and email/marketing campaigns.
Based on these interactions, we should be able to loosely prioritize which prospect is the next best target to contact next.
To maintain this prioritized list of prospects, we'll use an Event object to track the prospect's interactions.

#### Event Object

We'll be tracking various events, like a prospect asking us to call him back later, or we send him an email and he clicks on it.
The current categories are:

* Call Events
* Email Events
* Demo Events
* Trial Events
* Signup Events

These categories provide a loose model of how a prospect progresses down a conversion path:

    1) We call or email a prospect to schedule a demo.

    2) The prospect is given a demo of the product and can opt to sign up for a trial.

    3) The trial expires and the prospect can opt to signup and become a paid user.

Each of these categories has many events within them.
Some events indicate positive interest.  These events should increase the priority of the prospect.

#### Call Events

When calling a prospect, there are 4 typical outcomes:

* leave a voicemail
* prospect asks us to callback later (shows interest, priority increase)
* prospect gives us a hard reject (this prospect won't be contacted anymore, but it would be good to record why they aren't interested, priority drops)
* prospect asks for an email for information (shows interest, prority increase)
* prospect schedules an demo (success for this phase)

#### Email Events

When emailing a prospect, we want to track their interactions to guage interest.
Keep in mind, email events can originate from mass email campaigns or from solicited requests by a prospect.

* email is sent (solicited or not)
* email is opened
* email is clicked

If an email is solicited, and several days pass without opening, perhaps we should increase the priority of the prospect.
A similar response might also apply to clicking.

#### Click Events

When a prospect comes to the site, we track what they click on.
Items of interest are:

* prospect clicked the video
* prospect clicked pricing
* prospect clicked signup

If a prospect visits the site but doesn't click on any of the links of interest, perhaps we should increase the priority of the prospect.
If a user clicks on signup, that is a high priority prospect because they are ready to convert.

#### Demo Events

When a demo is successfully scheduled, the possible outcomes are:

* prospect signs up for a 30 day trial (success)
* prospect says no thanks (needs a reason)
* prospect says maybe (needs a follow up)

#### Trial Events

During the 30 day trial, there will be several events which we need to keep track of.  This is more of a monitoring phase to make sure the prospects are using the system.
Events of interest might be:

* prospect logs in
* prospect creates a Form 4
* prospect test files a Form 4
* prospect live files a Form 4
* trial period expires

Ideally, prospects should have higher priority when they are within X days of trial expiration.  At this point, they shoudl be contacted to see if they want their service to continue, or if an extended trial is in order.

#### Signup Events

This is the end scenario.  We record this event to mark the prospect as closed.
