# gpm2Iso

For NHD, ADCAN, AK:
replace
<gmd:date>
  <gco:Date>Unknown</gco:Date>
</gmd:date>
with 
 <gmd:date gco:nilReason="unknown"/>
 
 and 
 
 <gmd:sourceExtent>
                        <gmd:EX_Extent>
                           <gmd:temporalElement>
                              <gmd:EX_TemporalExtent>
                                 <gmd:extent><!--in the  source citation--><!--In the NHD (source)--><!--TimePeriodD: NHD6178-->
                                    <gml:description>ground condition</gml:description>
                                    <gml:timePosition indeterminatePosition="unknown"/>
                                 </gmd:extent>
                              </gmd:EX_TemporalExtent>
                           </gmd:temporalElement>
                        </gmd:EX_Extent>
                     </gmd:sourceExtent>
                     
                     
                     with (insert time instant)
                     
                     <gmd:sourceExtent>
                        <gmd:EX_Extent>
                           <gmd:temporalElement>
                              <gmd:EX_TemporalExtent>
                                 <gmd:extent><!--in the  source citation--><!--In the NHD (source)--><!--TimePeriodD: NHD6178-->
                                    <gml:TimeInstant gml:id ="NHD">
                                    <gml:description>ground condition</gml:description>
                                    <gml:timePosition indeterminatePosition="unknown"/></gml:TimeInstant>
                                 </gmd:extent>
                              </gmd:EX_TemporalExtent>
                           </gmd:temporalElement>
                        </gmd:EX_Extent>
                     </gmd:sourceExtent>
                     
                     Fix the file:/H:/MetadataSchemas/xslts/gpm2iso/SourceInformation.xsl so that single dates can work!!!!!!!!!!!
