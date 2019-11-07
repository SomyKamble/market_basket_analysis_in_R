#market basket analysis 

#support , confidence and lift 

library(arules)
library(arulesViz)
data(Groceries)
#gives the basket 
inspect(Groceries)
# to read transaction in csv

read.transactions(file.choose())
#please look at the confidence and the support 
gr_rule<-apriori(Groceries)

gr_rule<-apriori(Groceries,parameter =  list(supp=0.1,conf=.8))

# check the association rule 
inspect(gr_rule[1:5])

#need to fint tune the parameters to get good rules 
gr_rule<-apriori(Groceries,parameter =  list(supp=0.001,conf=.8))

#inspec to the find the rules
inspect(gr_rule[1:5])

#get new rules 
inspect(gr_rule[1:15])

#lets remove duplicate rules 
 gr_rule
 
 redundant_r<-is.redundant(gr_rule)
 redundant_r
 #true indiccate duplicate rules 
 summary(redundant_r)
 gr_rule<-gr_rule[!redundant_r]
 gr_rule
 
 #lets see what was brought along with whole wheat 
 
gr_rule_whole_milk<-apriori(Groceries,parameter = list(supp=0.001,conf=0.08),appearance = list(default="rhs",lhs="whole milk"))

inspect(gr_rule_whole_milk)
#plotting the rule with the help of arulesviz
plot(gr_rule,method = "graph",interactive = T)


