# -*- coding: utf-8 -*-
"""Trabalho em Python

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1R4fV1A6PX_h0_8eM9v1AJ6p9b0AH6yJF
"""

!pip3 install rdkit
!pip install rq
import configparser
import csv
import gzip
import logging
import math
import os
import shutil
import time
from multiprocessing import Pool

import numpy as np

import pandas as pd

from rdkit import Chem, RDLogger
from rdkit.Chem import Descriptors, MolSurf, rdMolDescriptors
from redis import Redis
from rq import Queue

banco_de_dados = '/content/drive/MyDrive/ecmdb1.xlsx'

all_mols = Chem.SDMolSupplier(banco_de_dados)
mol = all_mols[0]

len(all_mols)

all_mols = Chem.SDMolSupplier(banco_de_dados)
nmols = len(all_mols)
cont_error = 0
str_csv_file = ''
print(nmols)

dados = []
dados.append(Chem.MolToSmiles(mol))
dados.append(rdMolDescriptors.CalcMolFormula(mol))
dados.append(round(Descriptors.ExactMolWt(mol), 2))
dados.append(round(Descriptors.MolLogP(mol), 2))
dados.append(Descriptors.NumHAcceptors(mol))
dados.append(Descriptors.NumHDonors(mol))
dados.append(rdMolDescriptors.CalcNumRotatableBonds(mol))
dados.append(Descriptors.RingCount(mol))
dados.append(round(MolSurf.TPSA(mol), 2))
Chem.MolToMolBlock(mol)

print(str(dados))

str_csv_file = ''
count = 0 
for mol in all_mols:
  if mol is not None:
    try:
      str_csv_file = ''.join([str_csv_file, ','.join([str(Chem.MolToSmiles(mol)), str(rdMolDescriptors.CalcMolFormula(mol)), str(round(Descriptors.ExactMolWt(mol),2)), str(round(Descriptors.MolLogP(mol),2)), str(Descriptors.NumHAcceptors(mol)), str(Descriptors.NumHDonors(mol)), str(rdMolDescriptors.CalcNumRotatableBonds(mol)), str(Descriptors.RingCount(mol)), str(round(MolSurf.TPSA(mol),2))]), '\n'])
      count += 1
      if(count >= 100000):
        break
    except:
      cont_error += 1
print("str_csv_file pronta", cont_error)
open('/content/drive/MyDrive/base_ecmdb.csv', 'w').write(str_csv_file)
print("File ready")
