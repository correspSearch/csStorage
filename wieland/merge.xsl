<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xml"/>
    
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Wielands Briefwechsel</title>
                        <editor>Robert Charlier<email>charlier@bbaw.de</email></editor>
                    </titleStmt>
                    <publicationStmt>
                        <publisher>
                            <ref target="https://www.bbaw.de">Berlin-Brandenburgische Akademie der Wissenschaften</ref>
                        </publisher>
                        <idno type="url">https://correspsearch.net/storage/wieland/gesamt.xml</idno>
                        <date when="2024-03-15"/>
                        <availability>
                            <licence target="https://creativecommons.org/publicdomain/zero/1.0/">This file is licensed under the Creative Commons licence CC0</licence>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <xsl:call-template name="rootcopy-bibl"/>            
                    </sourceDesc>
                </fileDesc>
                <profileDesc>
                    <xsl:copy>
                        <xsl:call-template name="rootcopy-correspDesc"/>
                    </xsl:copy>                    
                </profileDesc>
            </teiHeader>
            <text>
                <body>
                    <p/>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template name="rootcopy-correspDesc">      
        <xsl:copy>            
            <xsl:variable name="folderURI" select="resolve-uri('.',base-uri())"/>
            <xsl:for-each select="collection(concat($folderURI, '?select=*.xml;recurse=yes'))//tei:correspDesc">
                <xsl:apply-templates mode="copy" select="."/>                
            </xsl:for-each>            
        </xsl:copy>        
    </xsl:template>   
    
    <xsl:template name="rootcopy-bibl">      
        <xsl:copy>            
            <xsl:variable name="folderURI" select="resolve-uri('.',base-uri())"/>            
            <xsl:for-each select="collection(concat($folderURI, '?select=*.xml;recurse=yes'))//tei:sourceDesc/tei:bibl">                
                <xsl:apply-templates mode="copy" select="."/>                
            </xsl:for-each>            
        </xsl:copy>        
    </xsl:template>   
    
    <!-- Deep copy template -->
    <xsl:template match="node()|@*" mode="copy">
        <xsl:copy>
            <xsl:apply-templates mode="copy" select="@*"/>            
            <xsl:apply-templates mode="copy"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Handle default matching -->
    
    <xsl:template match="*"/>
    
</xsl:stylesheet>