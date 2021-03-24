<style>
	.side-depth02{display:none;}
	.side-depth02.subopen{display:block;}
	.side-depth02 > li{}
	.side-depth02 > li > a{font-size:12px!important;background-image:none;color:#575757!important;/*background-color:#e8e6e6;*/}
	.side-depth02 > li:hover > a{background-color:#9b9b9b;}
</style>

<div id="sidebar" style="float:left;">
						<!-- side account -->
						<% If category<>"" Then %>
						<div class="side_block">
							<div class="vmenu">
								<ul class="side-nav">
								<% If category=1 Then %>
									<li <% If menu=1 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/introduce/greeting2.asp" >Message from the Dean</a>
									</li>

									<li <% If menu=2 Then %>class="current_page_item bool"<% end if %> class="menu-left">
                                    	<!--<a href="<%=template_directory%>/introduce/feature.asp">Pride KVCIT</a>-->
                                    	<a href="#">Pride KVCIT</a>
                                    	<ul class="side-depth02">
											<li><a href="<%=template_directory%>/introduce/feature.asp">- Educational System</a></li>
											<li><a href="<%=template_directory%>/pride_it/campus.asp">- Educational Environment</a></li>
											<li><a href="<%=template_directory%>/pride_it/it5.0.asp">- Korea IT 5.0</a></li>
											<li><a href="<%=template_directory%>/pride_it/project.asp">- Project Contest</a></li>
										</ul>
									</li>

									<li <% If menu=3 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/introduce/overview.asp" >Overview</a>
									</li>
									<li <% If menu=4 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/introduce/history.asp" >History</a>
									</li>
									<li <% If menu=5 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/introduce/organization.asp" >Board of Trustees</a>
									</li>
									<li <% If menu=6 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/introduce/campus.asp" >Campus Tour</a>
									</li>
									<li <% If menu=7 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/introduce/map.asp" >Location&#38;Hours</a>
									</li>
									<li <% If menu=8 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/introduce/adress.asp" >Contacts Information</a>
									</li>
								<% ElseIf category=2 Then %>
									<li <% If menu=1 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/study/overview_study.asp" >Overview</a>
									</li>
									<li <% If menu=2 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/study/degree.asp" >Courses</a>
									</li>
									<li <% If menu=3 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/study/apply.asp" >Application</a></li>
									<li <% If menu=4 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/study/calender.asp" >Academic Calendar</a>
									</li>
									<li <% If menu=5 Then %>class="current_page_item"<% end if %> class="menu-left"><a href="#">Undergraduate Degree</a>
										<ul class="side-depth02">
											<li><a href="<%=template_directory%>/department/major1.asp">- Game</a></li>
											<li><a href="<%=template_directory%>/department/major2.asp">- Information Security</a></li>
											<li><a href="<%=template_directory%>/department/major3.asp">- Design</a></li>
											<li><a href="<%=template_directory%>/department/major4.asp#">- Fusion Smart</a></li>
										</ul>
									</li>
								<% ElseIf category=3 Then %>
									<li <% If menu=1 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/help/visa.asp" >VISA</a>
									</li>
									<li <% If menu=2 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/help/insurance.asp" >Insurance</a>
									</li>
									<li <% If menu=3 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/help/housing.asp" >Housing</a>
									</li>
									<li <% If menu=4 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/help/faq.asp" >FAQS</a>
									</li>
								<% ElseIf category=4 Then %>
									<li <% If menu=1 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/notice/list.asp" >Notice Board</a>
									<li <% If menu=2 Then %>class="current_page_item"<% end if %>><a href="<%=template_directory%>/notice2/list.asp" >Interview</a>

								<%End if%>
									</ul>
								</div>
						</div><!-- side main menu -->
						<% End If %>


</div>
<!--------------------content Area Start------------------------->
<div id="content" style="float:right;">
<div id="main-content-area" class="clearfix width-100" style="padding: 55px 0 45px; background: #fff; overflow: hidden !important; clear: both;">
				<div class="post-content">
					<div class="demo-sep sep-none" style="margin-top:-55px;"></div>
