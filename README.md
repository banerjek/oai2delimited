Usage: xmlstarlet tr oai.xsl hca.xml | sed 's/ *\t[ ;]*/\t/g'

Sed necessary to strip whitespace used to make template more readable and also repeated field delimiters necessary because XSLT position doesn't work if whitespace text nodes are present 
