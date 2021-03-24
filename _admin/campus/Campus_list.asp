       <!-- 이미지 목록 -->
       <div class="contents">
            <ul class="tabs">
               <%
				  IF IsArray(AryCount) Then 
					  For i = 0 To UBound(AryCount)
					  	For j = 0 To UBound(AryCampus)
							IF StrComp(AryCount(i).item("gubun"), AryCampus(j).item("c_code")) = 0 Then 
			  %>
			   <li class="<%IF StrComp(Campus,AryCampus(j).item("c_code")) = 0 Then %>on<%END IF%>">
               		<a href="list.asp?mode=<%=mode%>&schCampus=<%=AryCampus(j).item("c_code")%>"> 
						<%=AryCampus(j).item("c_val")%>
                    </a>
               </li>
			  <%
			  					EXIT For 
			  				END IF
			  			NEXT
					  NEXT
				  END IF
			  %>
            </ul>
            <div class="listWrap">
             	<h3><%=AryImg(0).item("c_floor_val") & " " & AryImg(0).item("c_place_val")%></h3>
               <%
					IF isArray(AryImg) Then 
					 IF UBound(AryImg) = 0 AND StrComp(AryImg(0).item("idx"),0) = 0 Then 
				%>
                		<p>등록된 이미지가 없습니다.</p>
                <%
					 Else
						For i = 0 To UBound(AryImg)
							IF AryImg(i).item("idx") > 0 Then 
				%>
				<dl>
                    <dd>
                    	<IMG SRC="<%=AryImg(i).item("root") & AryImg(i).item("file")%>"/>
                    </dd>
                    <dt>
                    	<a href="list.asp?mode=<%=mode%>&schCampus=<%=AryImg(i).item("c_code")%>&schFloor=<%=AryImg(i).item("c_floor")%>&schPlace=<%=AryImg(i).item("c_place")%>&idx=<%=AryImg(i).item("idx")%>" class="" >
						<%=AryImg(i).item("c_floor_val") & " " & AryImg(i).item("c_place_val") & "_" & AryImg(i).item("seq")%>
                        </a>
                   </dt>
                </dl>
               <%
			   				END IF
							NEXT 
						END IF
					END IF
				%>

			</div>
            <div class="subnav">
                <ul class="tabContents floor_list">
                        <%
                            IF IsArray(AryCount) Then 
                                For i = 0 To UBound(AryCount)
									IF StrComp(AryCount(i).item("gubun"), Campus) = 0 Then
										Floor_chk = 1
                        %>
                            <li class="on">
                                <ul>
                        <%
                                    	For j = 0 To UBound(AryCampus)
                                        	IF StrComp(AryCampus(j).item("c_floor"), Floor_chk) = 0 AND StrComp(AryCampus(j).item("c_code"), AryCount(i).item("gubun")) = 0 Then 
												Place_chk = 1
                        %>
                            <li class="on">
                            	<h3><%=AryCampus(j).item("c_floor_val")%></h3>
                                <ul>
                        <%
                                    For k = 0 To UBound(AryCampus)
                                        IF StrComp(AryCampus(k).item("c_floor"), Floor_chk) = 0 AND StrComp(AryCampus(k).item("c_place"), Place_chk) = 0  AND StrComp(AryCampus(k).item("c_code"), AryCount(i).item("gubun")) = 0  AND StrComp(AryCampus(k).item("c_code"), AryCount(i).item("gubun")) = 0 Then 
                        %>
                        <li class="list_place <% IF StrComp(AryCampus(k).item("c_place"), Place) = 0 AND StrComp(AryCampus(k).item("c_floor"), Floor) = 0 Then %>on<%END IF%>">
                            <a href="list.asp?mode=<%=mode%>&schCampus=<%=AryCampus(k).item("c_code")%>&schFloor=<%=AryCampus(k).item("c_floor")%>&schPlace=<%=AryCampus(k).item("c_place")%>" class="" > 
								<%=AryCampus(k).item("c_place_val")%>
                            </a> 
                        </li>
                        <%
											Place_chk = Place_chk + 1
                                        END IF
                                    NEXT
                        %>
                        		</ul> 
                            </li>
                        <%
											Floor_chk = Floor_chk + 1
										  END IF
									  NEXT
                        %>
                                </ul>
                            </li>
                        <%
									END IF
                                NEXT
                            END IF
                        %>
                    </ul>
             </div>
            

       </div>