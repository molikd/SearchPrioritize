#!/bin/bash

for option in $( cat options_combinations.txt); do
	echo $option
	cp qsub_template.sh qsub_template_temp.sh
	sed -i "s/search_template/$option/g" qsub_template_temp.sh
	qsub qsub_template_temp.sh
	#qsub -hold_jid $1 qsub_template_temp.sh
	rm qsub_template_temp.sh
done
