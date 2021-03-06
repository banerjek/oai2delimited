<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/OAI-PMH/ListRecords">
  <xsl:for-each select="record/metadata">
    <xsl:apply-templates select="identifier"/>
    <xsl:text>&#x9;</xsl:text>
    <!-- <xsl:apply-templates select="subject" />
    <xsl:text>&#x9;</xsl:text> -->
    <xsl:value-of select="file" />
    <xsl:text>&#x9;</xsl:text>
    <xsl:value-of select="title" />
    <xsl:text>&#x9;</xsl:text>
    <xsl:value-of select="date" />
    <xsl:text>&#x9;</xsl:text>
    <xsl:value-of select="creator" />
    <xsl:text>&#x9;</xsl:text>
    <xsl:value-of select="publisher" />
    <xsl:text>&#x9;</xsl:text>
    <!-- <xsl:apply-templates select="description" /> -->
    <xsl:text>&#x9;</xsl:text>
    <xsl:text>&#xA;</xsl:text>
  </xsl:for-each>
</xsl:template>
<!-- DOI and filename are both stored in identifier so field
is processed twice to preserve order -->
<xsl:template match="identifier">
  <xsl:for-each select=".">
    <xsl:if test="starts-with(., 'doi:')">
      <xsl:value-of select="." />
    </xsl:if>
  </xsl:for-each>

  <xsl:for-each select=".">
      <xsl:value-of select="substring-after(., 'https://digitalcollections.ohsu.edu/files/original/')" />
  </xsl:for-each>

</xsl:template>

<xsl:template match="creator|contributor|publisher|description|subject">
  <xsl:for-each select=".">
    <!-- can't test position so we add the delimiter and strip it later -->
    <xsl:text>;;;</xsl:text>
    <xsl:value-of select="." />
  </xsl:for-each>
</xsl:template>
</xsl:stylesheet>

