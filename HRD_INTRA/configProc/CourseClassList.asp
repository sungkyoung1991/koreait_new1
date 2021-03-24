<%
Class CourseClassList

	private mClscd
	private mClsname
	
	public property let Clscd(pClscd) 
		mClscd = pClscd 
	end property 
	
	public property get Clscd() 
		Clscd = mClscd 
	end property
	
	public property let Clsname(pClsname) 
		mClsname = pClsname 
	end property 
	
	public property get Clsname() 
		Clsname = mClsname
	end property
	
	
END Class
%>