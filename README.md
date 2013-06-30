Smsapp - December 2011
======================

Simple rails application which uses Orange SMS API (no more developed, closing in September 2013).
Allows to run bash commands on a server by SMS.

A registered user defines bash commands and their aliases (short names). Then a user can sent SMS on given Orange API number with an alias of command.

Application recognizes a user by his mobile number, then checks content of sms and tries to run command on a server if it's defined and allowed.
