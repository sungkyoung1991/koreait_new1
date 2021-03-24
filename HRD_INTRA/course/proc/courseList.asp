<%
Class CourseList

	private mCrcd
	private mCrtitle
	private mCrinning
	private mClscd
	private mClsName
	private mDivcd
	private mDivName
	private mScode
	private mSName
	private mEdusdate
	private mEduedate
	private mEdustime
	private mEduetime
	private mEdudays
	private mEduhours
	private mIsImg
	private mIsNcs
	private mCrStatus
	private mAppcnt
	private mEduDate
	private mLinkHead
	private mLinkTail
	private mEdugubun

	public property let Crcd(pCrcd) 
		mCrcd = pCrcd 
	end property 
	
	public property get Crcd() 
		Crcd = mCrcd 
	end property
	
	public property let Crtitle(pCrtitle) 
		mCrtitle = pCrtitle
	end property 
	
	public property get Crtitle() 
		Crtitle = mCrtitle
	end property
	
	public property let Crinning(pCrinning) 
		mCrinning = pCrinning
	end property 
	
	public property get Crinning() 
		Crinning = mCrinning
	end property
		
	public property let Clscd(pClscd) 
		mClscd = pClscd
	end property 
	
	public property get Clscd() 
		Clscd = mClscd
	end property
	
	public property let ClsName(pClsName) 
		mClsName = pClsName
	end property 
	
	public property get ClsName() 
		ClsName = mClsName
	end property
	
	public property let Divcd(pDivcd) 
		mDivcd = pDivcd
	end property 
	
	public property get Divcd() 
		Divcd = mDivcd
	end property
	
	public property let DivName(pDivName) 
		mDivName = pDivName
	end property 
	
	public property get DivName() 
		DivName = mDivName
	end property
	
	public property let Scode(pScode) 
		mScode = pScode
	end property 
	
	public property get Scode() 
		Scode = mScode
	end property
	
	public property let SName(pSName) 
		mSName = pSName
	end property 
	
	public property get SName() 
		SName = mSName
	end property
	
	public property let Edusdate(pEdusdate) 
		mEdusdate = pEdusdate
	end property 
	
	public property get Edusdate() 
		Edusdate = mEdusdate
	end property
	
	public property let Eduedate(pEduedate) 
		mEduedate = pEduedate
	end property 
	
	public property get Eduedate() 
		Eduedate = mEduedate
	end property
	
	public property get EduDate()
		EduDate = mEdusdate & " ~ " & mEduedate
	end property
	
	public property let Edustime(pEdustime) 
		mEdustime = pEdustime
	end property 
	
	public property get Edustime() 
		Edustime = mEdustime
	end property
	public property let Eduetime(pEduetime) 
		mEduetime = pEduetime
	end property 
	
	public property get Eduetime() 
		Eduetime = mEduetime
	end property
	
	public property let Edugubun(pEdugubun) 
		mEdugubun = pEdugubun
	end property 
	
	public property get Edugubun() 
		Edugubun = mEdugubun
	end property
	
	public property let Edudays(pEdudays)   
		mEdudays = pEdudays
	end property 
	
	public property get Edudays() 
		Edudays = mEdudays
	end property
	
	public property let Eduhours(pEduhours) 
		mEduhours = pEduhours
	end property 
	
	public property get Eduhours() 
		Eduhours = mEduhours
	end property
	
	public property let IsImg(pIsImg) 
		mIsImg = pIsImg
	end property 
	
	public property get IsImg() 
		IsImg = mIsImg
	end property
	
	public property let IsNcs(pIsNcs) 
		mIsNcs = pIsNcs
	end property 
	
	public property get IsNcs() 
		If mIsNcs = "Y" Then 
			IsNcs = "(N)"
		Else
			IsNcs = ""
		End IF
	end property
	
	public property let Appcnt(pAppcnt) 
		mAppcnt = pAppcnt
	end property 
	
	public property get Appcnt() 
		Appcnt = mAppcnt
	end property
	
	public property let CrStatus(pCrStatus) 
		mCrStatus = pCrStatus
	end property 
	
	public property get CrStatus() 
		CrStatus = mCrStatus
	end property
	
	public property let LinkHead(pLinkHead)
		mLinkHead = pLinkHead
	end property 
	public property get LinkHead()
		LinkHead = mLinkHead
	end property 
	
	public property let LinkTail(pLinkTail)
		mLinkTail = pLinkTail
	end property 
	public property get LinkTail()
		LinkTail = mLinkTail
	end property 
	
	public property get LinkTitle()
		LinkTitle = mLinkHead & mCrtitle & " " & mCrinning & " 회차" & IsNcs() & mLinkTail
	end property 
	
END Class
%>