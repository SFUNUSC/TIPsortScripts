#!/bin/bash

# Script to generate the Tigress/BGO hit pattern for a given run.
# Argument 1 is the run number.

#copy master files
mkdir MasterFiles
cp GenericMasterFiles/master26563_CsIArray_PID_ER MasterFiles/master"$1"_CsIArray_PID_ER

#replace master file strings with appropriate values
sed -i 's/26563/'"$1"'/g'  MasterFiles/master"$1"_CsIArray_PID_ER

#make the CsIArray PID ROOT file
mkdir CsIArray_PID_ER
CsIArray_PID_ER MasterFiles/master"$1"_CsIArray_PID_ER 0 10 0 10000000

#remove intermediate data files to save disk space and cleanup
echo ""
echo "Cleaning up..."
rm -rf MasterFiles/
rm CsIArray_PID_Ratio.mca
rm CsIArray_PID_Energy.mca

echo ""
echo "Done making the CsI PID ROOT file: CsIArray_PID_ER/run"$1"_CsIArray_PID_ER.root"
