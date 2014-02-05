Smsapp - December 2011
======================

Simple rails application which uses Orange SMS API (no more developed, closed in September 2013).
Allows a user to run bash commands on a server by SMS.

A registered user defines bash commands and their aliases (short names). Then the user can send an SMS on a given Orange API number with the alias of command.

Application recognizes a user by his mobile number, then checks content of sms and tries to run command on a server if it's defined and allowed.
