#!/bin/bash

cd /opt/nifi/nifi-1.4.0/lib
wget https://github.com/tspannhw/nifi-nlp-processor/releases/download/1.1/nifi-nlp-nar-1.0.nar

mkdir -p /opt/nifi/nifi-1.4.0/nlp-models
cd /opt/nifi/nifi-1.4.0/nlp-models
wget http://opennlp.sourceforge.net/models-1.5/en-ner-date.bin
wget http://opennlp.sourceforge.net/models-1.5/en-ner-location.bin
wget http://opennlp.sourceforge.net/models-1.5/en-ner-money.bin
wget http://opennlp.sourceforge.net/models-1.5/en-ner-organization.bin
wget http://opennlp.sourceforge.net/models-1.5/en-ner-percentage.bin
wget http://opennlp.sourceforge.net/models-1.5/en-ner-person.bin
wget http://opennlp.sourceforge.net/models-1.5/en-ner-time.bin
wget http://opennlp.sourceforge.net/models-1.5/en-chunker.bin
wget http://opennlp.sourceforge.net/models-1.5/en-parser-chunking.bin
wget http://opennlp.sourceforge.net/models-1.5/en-token.bin
wget http://opennlp.sourceforge.net/models-1.5/en-sent.bin
wget http://opennlp.sourceforge.net/models-1.5/en-pos-maxent.bin
wget http://opennlp.sourceforge.net/models-1.5/en-pos-perceptron.bin