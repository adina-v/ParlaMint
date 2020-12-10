test-cnv-si:
	$s outDir=ParlaMint-SI -xsl:Scripts/corpus2sample.xsl ../Master/ParlaMint-SI.TEI/ParlaMint-SI.xml
	$s outDir=ParlaMint-SI -xsl:Scripts/corpus2sample.xsl ../Master/ParlaMint-SI.TEI.ana/ParlaMint-SI.ana.xml

j = java -jar /usr/share/java/jing.jar 
vrt = $j Schema/ParlaMint-teiCorpus.rng 	# Corpus root / text
vct = $j Schema/ParlaMint-TEI.rng		# Corpus component / text
vra = $j Schema/ParlaMint-teiCorpus.ana.rng	# Corpus root / analysed
vca = $j Schema/ParlaMint-TEI.ana.rng		# Corpus component / analysed

val:
	ls ParlaMint-*/ParlaMint-*.xml | grep -v '.ana.' | grep -v '_' | xargs ${vrt}
	ls ParlaMint-*/ParlaMint-*.xml | grep -v '.ana.' | grep    '_' | xargs ${vct}
	ls ParlaMint-*/ParlaMint-*.xml | grep    '.ana.' | grep -v '_' | xargs ${vra}
	ls ParlaMint-*/ParlaMint-*.xml | grep    '.ana.' | grep    '_' | xargs ${vca}

#Generate samples
samples-v1:	clean-v1
	$s outDir=ParlaMint-BG -xsl:Scripts/corpus2sample.xsl ../Master/ParlaMint-BG.TEI/ParlaMint-BG.xml
	$s outDir=ParlaMint-BG -xsl:Scripts/corpus2sample.xsl ../Master/ParlaMint-BG.TEI.ana/ParlaMint-BG.ana.xml
	$s outDir=ParlaMint-HR -xsl:Scripts/corpus2sample.xsl ../Master/ParlaMint-HR.TEI/ParlaMint-HR.xml
	$s outDir=ParlaMint-HR -xsl:Scripts/corpus2sample.xsl ../Master/ParlaMint-HR.TEI.ana/ParlaMint-HR.ana.xml
	$s outDir=ParlaMint-PL -xsl:Scripts/corpus2sample.xsl ../Master/ParlaMint-PL.TEI/ParlaMint-PL.xml
	$s outDir=ParlaMint-PL -xsl:Scripts/corpus2sample.xsl ../Master/ParlaMint-PL.TEI.ana/ParlaMint-PL.ana.xml
	$s outDir=ParlaMint-SI -xsl:Scripts/corpus2sample.xsl ../Master/ParlaMint-SI.TEI/ParlaMint-SI.xml
	$s outDir=ParlaMint-SI -xsl:Scripts/corpus2sample.xsl ../Master/ParlaMint-SI.TEI.ana/ParlaMint-SI.ana.xml
clean-v1:
	rm -f ParlaMint-BG/*.xml
	rm -f ParlaMint-HR/*.xml
	rm -f ParlaMint-PL/*.xml
	rm -f ParlaMint-SI/*.xml

################################################
s = java -jar /usr/share/java/saxon.jar
P = parallel --gnu --halt 2