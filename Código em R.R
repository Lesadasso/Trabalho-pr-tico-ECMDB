install.packages("dplyr")
library("dplyr")
install.packages("tidyverse")
library(tidyverse)



base_de_dados <- read.csv('ecmdb1.csv')

ecmdb <- base_de_dados %>% select(name, state, moldb_smiles, moldb_formula, moldb_average_mass, moldb_mono_mass, moldb_logp, moldb_acceptor_count, moldb_donor_count, moldb_rotatable_bond_count, moldb_polar_surface_area)


ecmdb$moldb_average_mass <- as.numeric(ecmdb$moldb_average_mass)
ecmdb$moldb_mono_mass <- as.numeric(ecmdb$moldb_mono_mass)
ecmdb$moldb_logp <- as.numeric(ecmdb$moldb_logp) #
moldb_acceptor_count <- as.numeric(ecmdb$moldb_acceptor_count)#
ecmdb$moldb_moldb_donor_count <- as.numeric(ecmdb$moldb_moldb_donor_count)#
ecmdb$moldb_rotatable_bond_count <- as.numeric(ecmdb$moldb_rotatable_bond_count)#
cmdb$moldb_polar_surface_area <- as.numeric(ecmdb$moldb_polar_surface_area)#


hist(ecmdb$moldb_logp)
hist(ecmdb$moldb_acceptor_count)
hist(ecmdb$moldb_moldb_donor_count)
hist(ecmdb$moldb_rotatable_bond_count)
hist(cmdb$moldb_polar_surface_area)


boxplot(moldb_logp~state, data = ecmdb)

boxplot(moldb_rotatable_bond_count~state, data = ecmdb)



ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_logp , y = moldb_average_mass, color = state))
ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_logp , y = moldb_mono_mass, color = state))
ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_logp , y = moldb_acceptor_count, color = state))
ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_logp , y = moldb_donor_count, color = state))
ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_logp , y = moldb_rotatable_bond_count, color = state))
ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_logp , y = moldb_polar_surface_area, color = state))


ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_polar_surface_area , y = moldb_average_mass, color = state, shape = state))#
ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_polar_surface_area , y = moldb_mono_mass, color = state))#
ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_polar_surface_area , y = moldb_logp, color = state, shape = state))###
ggplot(data = ecmdb, mapping = aes(x = moldb_polar_surface_area , y = moldb_acceptor_count, color = state)) + geom_point()##
ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_polar_surface_area , y = moldb_donor_count, color = state))
ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_polar_surface_area , y = moldb_rotatable_bond_count, color = state))


ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_acceptor_count , y = moldb_donor_count, color = state, shape = state))#
ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_acceptor_count , y = moldb_logp, color = state))
ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_acceptor_count , y = moldb_rotatable_bond_count, color = state, shape = state))
ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_acceptor_count , y = moldb_polar_surface_area, color = state, shape = state))

ggplot(data = ecmdb) + geom_point(mapping = aes(x = moldb_rotatable_bond_count , y = moldb_donor_count, color = state, shape = state))

