#!/bin/bash
java -jar $HOME/bin/plantuml.jar -tpng $@
open ${@%%.*}.png
