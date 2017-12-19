# SimpleOj
A simplest online judging system with scoreboard.


### Developing enviorment
* Ruby 2.4.2
* Rails 5.1.4
* Pandoc 2.0.5

### Structure of data base
* **users**: Storing the user's id, password, counter of AC, and the score.
* **problems**: Storing the title of problems. The content is stored in the filesystem.
* **submissions**: Storing the code and status of user's submission.
* **questions**: Storing the request and response of user's question.

### TODO
* Security.
* User adding form.
* Qusetion asking backstage.
* Add code signature(GPG) during transmission toward judger.

### Licence
MIT

### Author
_ifTNT_ @NUKCSIE
