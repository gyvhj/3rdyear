<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
        <head>
            <title>Question Paper</title>
            <style>
                body { font-family: Arial; background: #f2f2f2; padding: 20px; }
                .question { margin-bottom: 20px; background: #fff; padding: 15px; border-radius: 8px; box-shadow: 0 0 5px #ccc; }
                .text { font-weight: bold; }
                .options { margin-left: 20px; }
                .answer { color: green; margin-top: 8px; font-style: italic; }
            </style>
        </head>
        <body>
            <h1>Question Paper</h1>
            <xsl:for-each select="question-paper/question">
                <div class="question">
                    <div class="text">
                        Q<xsl:value-of select="@no" />: 
                        <xsl:value-of select="text" />
                    </div>
                    <div class="options">
                        A. <xsl:value-of select="optionA" /><br/>
                        B. <xsl:value-of select="optionB" /><br/>
                        C. <xsl:value-of select="optionC" /><br/>
                        D. <xsl:value-of select="optionD" />
                    </div>
                    <div class="answer">
                        Answer: <xsl:value-of select="answer" />
                    </div>
                </div>
            </xsl:for-each>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
