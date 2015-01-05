Xmhell
======

Just a simple XML parser.

### The idea:

There are 4 things in XML that are of interest:

1. __section__ - a body of text of XML that is opened and closed by __elements__. (From ```<head>``` to ```</head>``` in HTML for example)
1. __elements__ - the outtermost parts of any XML __document__. (```<head>``` is an opening element named "head")
1. __attributes__ - keys that are nested inside __element__ tags.(In the case ```<div class="Giant">Thing</div>``` the word 'class' is an attribute)
1. __values__ - data that belong to with __elements__ or __attributes__ (In the case ```<div class="Giant">Thing</div>``` the word "Giant" is the __value__ of the div's class __attribute__)
