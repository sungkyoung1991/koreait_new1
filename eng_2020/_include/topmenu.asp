			<header id="header">
				<div class="avada-row" style="margin-top:0px;margin-bottom:0px;">
					<div class="logo"><a href="<%=template_directory%>/"><img src="<%=template_directory%>/img/common/logo_2020.png" alt="Korea Vocation College of Inforation and Technology" /></a></div>
							<nav id="nav" class="nav-holder"  >

								<ul class="menu">
									<li id="menu-item-1" <% If 1=CInt(category) Then %>class="current-menu-ancestor current-menu-parent"<%else%>class="menu-item menu-item-type-custom menu-item-object-custom"<% End If %>><a href="<%=template_directory%>/introduce/greeting2.asp" target="_self">Introduction</a>
										<ul class="sub-menu">
											<li id="menu-item-1-1" <% If (1=menu) And (1=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/introduce/greeting.asp" target="_self">Message from the Dean</a>
											</li>
											<li id="menu-item-1-2" <% If (2=menu) And (1=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/introduce/feature.asp" target="_self">Pride KVCIT</a>
											</li>
											<li id="menu-item-1-3" <% If (3=menu) And (1=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/introduce/overview.asp" target="_self">Overview</a>
											</li>
											<li id="menu-item-1-4" <% If (4=menu) And (1=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/introduce/history.asp" target="_self">History</a>
											</li>
											<li id="menu-item-1-5" <% If (5=menu) And (1=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/introduce/organization.asp" target="_self">Board of Trustees</a>
											</li>
											<li id="menu-item-1-6" <% If (6=menu) And (1=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/introduce/campus.asp" target="_self">Campus Tour</a>
											</li>
											<li id="menu-item-1-7" <% If (7=menu) And (1=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/introduce/map.asp" target="_self">Location&#38;Hours</a>
											</li>
											<li id="menu-item-1-8" <% If (8=menu) And (1=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/introduce/adress.asp" target="_self">Contacts Information</a>
											</li>
										</ul>
									</li>



									<li id="menu-item-2" <% If 2=CInt(category) Then %>class="current-menu-ancestor current-menu-parent"<%else%>class="menu-item menu-item-type-custom menu-item-object-custom"<% End If %>><a href="<%=template_directory%>/study/overview_study.asp" target="_self">Study at KVCIT</a>
										<ul class="sub-menu">
											<li id="menu-item-2-1" <% If (1=menu) And (2=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/study/overview_study.asp" target="_self">Overview</a>
											</li>
											<li id="menu-item-2-2" <% If (2=menu) And (2=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/study/degree.asp" target="_self">Courses</a>
											</li>
											<li id="menu-item-2-3" <% If (3=menu) And (2=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/study/apply.asp" target="_self">Application</a>
											<li id="menu-item-2-4" <% If (4=menu) And (2=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/study/calender.asp" target="_self">Academic Calendar</a>
											</li>
											<li id="menu-item-2-5" <% If (4=menu) And (2=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/department/major1.asp" target="_self">Undergraduate Degree</a>
											</li>
										</ul>
									</li>

									<li id="menu-item-3" <% If 3=CInt(category) Then %>class="current-menu-ancestor current-menu-parent"<%else%>class="menu-item menu-item-type-custom menu-item-object-custom"<% End If %>><a href="<%=template_directory%>/help/visa.asp" target="_self">i HELP</a>
										<ul class="sub-menu">
											<li id="menu-item-3-1" <% If (1=menu) And (3=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/help/visa.asp" target="_self">VISA</a>
											</li>
											<li id="menu-item-3-2" <% If (2=menu) And (3=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/help/insurance.asp" target="_self">Insurance</a>
											</li>
											<li id="menu-item-3-3" <% If (3=menu) And (3=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/help/housing.asp" target="_self">housing</a>
											</li>
											<li id="menu-item-3-4" <% If (4=menu) And (3=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/help/faq.asp" target="_self">FAQS</a>
											</li>
										</ul>
									</li>

									<li id="menu-item-4" <% If 4=CInt(category) Then %>class="current-menu-ancestor current-menu-parent"<%else%>class="menu-item menu-item-type-custom menu-item-object-custom"<% End If %>><a href="<%=template_directory%>/notice/list.asp" target="_self">News &#38; Event</a>
										<ul class="sub-menu">
											<li id="menu-item-4-1" <% If (1=menu) And (4=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/notice/list.asp" target="_self">Notice Board</a>
											</li>

											<li id="menu-item-4-2" <% If (1=menu) And (4=category)  Then %>class="current-menu-item"<% End If %>><a href="<%=template_directory%>/notice2/list.asp" target="_self">Interview</a>
											</li>


										</ul>
									</li>
								</ul>
							</nav>
				</div>
			</header>

			<!--s:mobile_header-->
			<header class="m-header">
				<h1 class="logo"><a href="/index.asp"><img src="<%=template_directory%>/img/common/logo_2020.png" alt="한국IT영재교육원로고"></a></h1>
				<div class="mbtn">
					<div class="nav-icon">
						<span></span>
						<span></span>
						<span></span>
					</div>
				</div>
			</header>
			<div class="mobile-menu">
				<div class="main-menu">
					<ul class="m-depth01">
						<li>
							<a href="#">Intoduction</a>
							<ul class="m-depth02">
								<li><a href="<%=template_directory%>/introduce/greeting.asp">Message from the Dean</a></li>
								<li><a href="<%=template_directory%>/introduce/greeting2.asp">Pride KVCIT</a></li>
								<li><a href="<%=template_directory%>/introduce/feature.asp" style="background-color:#1f3a6f;"> - Educational System</a></li>
								<li><a href="<%=template_directory%>/pride_it/campus.asp" style="background-color:#1f3a6f;"> - Educational Environment</a></li>
								<li><a href="<%=template_directory%>/pride_it/it5.0.asp" style="background-color:#1f3a6f;"> - Korea IT 5.0</a></li>
								<li><a href="<%=template_directory%>/pride_it/project.asp" style="background-color:#1f3a6f;"> - Project Contest</a></li>
								<li><a href="<%=template_directory%>/introduce/overview.asp">Overview</a></li>
								<li><a href="<%=template_directory%>/introduce/history.asp">History</a></li>
								<li><a href="<%=template_directory%>/introduce/organization.asp">Board of Trustees</a></li>
								<li><a href="<%=template_directory%>/introduce/campus.asp">Campus Tour</a></li>
								<li><a href="<%=template_directory%>/introduce/map.asp">Location&#38;Hours</a></li>
								<li><a href="<%=template_directory%>/introduce/adress.asp">Contacts Information</a></li>
							</ul>
						</li>
						<li>
							<a href="#">Study at KVCIT</a>
							<ul class="m-depth02">
								<li><a href="<%=template_directory%>/study/overview_study.asp">Overview</a></li>
								<li><a href="<%=template_directory%>/study/degree.asp">Courses</a></li>
								<li><a href="<%=template_directory%>/study/apply.asp">Application</a></li>
								<li><a href="<%=template_directory%>/study/calender.asp">Academic Calendar</a></li>
								<li><a href="#">Undergraduate Degree</a></li>
								<li><a href="<%=template_directory%>/department/major1.asp" style="background-color:#1f3a6f;"> - Game Course</a></li>
								<li><a href="<%=template_directory%>/department/major2.asp" style="background-color:#1f3a6f;"> - Information Security Course</a></li>
								<li><a href="<%=template_directory%>/department/major3.asp" style="background-color:#1f3a6f;"> - Design Course</a></li>
								<li><a href="<%=template_directory%>/department/major4.asp#" style="background-color:#1f3a6f;"> - Fusion Smart Course</a></li>
							</ul>
						</li>
						<li>
							<a href="#">i HELP</a>
							<ul class="m-depth02">
								<li><a href="<%=template_directory%>/help/visa.asp">VISA</a></li>
								<li><a href="<%=template_directory%>/help/insurance.asp">Insurance</a></li>
								<li><a href="<%=template_directory%>/help/housing.asp">Housing</a></li>
								<li><a href="<%=template_directory%>/help/faq.asp">Quick Link</a></li>
							</ul>
						</li>
						<li>
							<a href="#">News&#38;Event</a>
							<ul class="m-depth02">
								<li><a href="<%=template_directory%>/notice/list.asp">Notice Board</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<!--e:mobile_header-->
