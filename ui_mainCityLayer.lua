
-- 主界面  利用滑动显示或消失界面的按钮 
cc.exports.MainCity={
    mMainLayer=nil,
	main_lay=nil,
	panelRoot1=nil,
	panelRoot2=nil,
	proPosition=nil,
	downBut=nil,
	isTouch=true,
	rightButton=nil,
	rightTouch=true,
	
}

function MainCity.load()
	MainCity.mMainLayer = cc.Layer:create()
 	MainCity.main_lay = cc.CSLoader:createNode("UI/allcsd/MainCityLayer.csb")
	MainCity.main_lay:setOpacity(0)
	MainCity.mMainLayer:retain()
	MainCity.mMainLayer:addChild(MainCity.main_lay)
	MainCity.main_lay:setTag(1)
	return MainCity.mMainLayer
end
	
function MainCity.show()
	Util.addCurrentScene(MainCity.mMainLayer)
    Util.layerToOther(MainCity.main_lay )
    --cc.SimpleAudioEngine:getInstance():playMusic("sound/main.mp3",true)
    -- cc.SimpleAudioEngine:getInstance():setMusicVolume(0.5)
    -- cc.SimpleAudioEngine:getInstance():playEffect("sound/readygo.mp3")
    -- cc.SimpleAudioEngine:getInstance():stopAllEffects()
    -- if AudioEngine.isMusicPlaying () then -- 音乐正在播放  
    --     AudioEngine.stopMusic()

    -- 	AudioEngine.playMusic("sound/main.mp3",false) -- 播放音乐  
    -- end
    -- if cc.SimpleAudioEngine:getInstance():isMusicPlaying() then
     	cc.SimpleAudioEngine:getInstance():stopMusic()
    	cc.SimpleAudioEngine:getInstance():playMusic(Constants.SOUND[2],true)
    	
    --end
	-- clound action 
	
	local panelClound = MainCity.main_lay:getChildByName("background")
	local move=cc.MoveTo:create(100,cc.p(1136,0))
	local place=cc.Place:create(cc.p(-1140,0))
	--panelClound:runAction(cc.RepeatForever:create(cc.Sequence:create(move,place)))

	MainCity_showTouchButton()
end

function cc.exports.MainCity_showTouchButton()
	-- left and right mainButton
	local  leftMainBut={}
	local  rightMainBut={}
	-- left and right panel
	local leftPanel={}
	local rightPanel={}
	-- each little buttons
	local leftButtons={}
	local rightButtons={}

	-- local layers={

	-- 	Login.mLoginLayer,
	-- 	HeroList.mHeroListLayer,
	-- 	--Loading.mLoadingLayer,
	-- 	WorldMap.mWorldMapLayer,
	-- 	--Server.mServerLayer,
	-- 	--RoleMsg.mRoleMsgLayer,
	-- 	--Reward.mRewardLayer,
	-- 	SelectLevel.mSelectLevelLayer
	-- }

    local leftPanelRoot = MainCity.main_lay:getChildByName("Panel_1")
    local rightPanelRoot = MainCity.main_lay:getChildByName("Panel_7") 

    -- left panel 

    leftMainBut[1]=ccui.Helper:seekWidgetByName(leftPanelRoot, "Button_1")
	leftMainBut[2]=ccui.Helper:seekWidgetByName(leftPanelRoot, "Button_1_0")
	leftMainBut[3]=ccui.Helper:seekWidgetByName(leftPanelRoot, "Button_1_1")
	leftMainBut[4]=ccui.Helper:seekWidgetByName(leftPanelRoot, "Button_1_2")

	rightMainBut[1]=ccui.Helper:seekWidgetByName(rightPanelRoot, "Button_7")
	rightMainBut[2]=ccui.Helper:seekWidgetByName(rightPanelRoot, "Button_7_0_0")
	rightMainBut[3]=ccui.Helper:seekWidgetByName(rightPanelRoot, "Button_7_1_0")
	rightMainBut[4]=ccui.Helper:seekWidgetByName(rightPanelRoot, "Button_7_2_0")



    leftPanel[1] = ccui.Helper:seekWidgetByName(leftPanelRoot, "Panel_2")
    leftPanel[2] = ccui.Helper:seekWidgetByName(leftPanelRoot, "Panel_4")
    leftPanel[3] = ccui.Helper:seekWidgetByName(leftPanelRoot, "Panel_5")
    leftPanel[4] = ccui.Helper:seekWidgetByName(leftPanelRoot, "Panel_6")
    
    -- right panel 
    rightPanel[2] = ccui.Helper:seekWidgetByName(rightPanelRoot, "Panel_5_0")
    rightPanel[3] = ccui.Helper:seekWidgetByName(rightPanelRoot, "Panel_5_0_0")
    rightPanel[4] = ccui.Helper:seekWidgetByName(rightPanelRoot, "Panel_5_0_1")


    local function getScorllViewButton( tagNum, butName )
    	local scrollRoot= nil
    	if 1 == tagNum then
    		scrollRoot = ccui.Helper:seekWidgetByName(leftPanel[2], "ScrollView_1")
    		scrollRoot:jumpToPercentVertical(0)

		elseif 2== tagNum then
    		scrollRoot = ccui.Helper:seekWidgetByName(leftPanel[3], "ScrollView_2")
    		scrollRoot:jumpToPercentVertical(0)

		elseif 3== tagNum then
    		scrollRoot = ccui.Helper:seekWidgetByName(rightPanel[2], "ScrollView_2_4")
		elseif 4== tagNum then
    		scrollRoot = ccui.Helper:seekWidgetByName(rightPanel[3], "ScrollView_2_4_6")
		elseif 5== tagNum then
    		scrollRoot = ccui.Helper:seekWidgetByName(rightPanel[4], "ScrollView_2_4_8")

		end
    	return ccui.Helper:seekWidgetByName(scrollRoot, butName)
    end

    local function getButtons( panelName, butName)
    	return ccui.Helper:seekWidgetByName(panelName, butName )
    end 

    -- left buttons 
    -- 1 系统 2 战斗 3 角色 4 特殊
    leftButtons[1]={
    	getButtons(leftPanel[1], "Button_2"),
    	getButtons(leftPanel[1], "Button_2_0"),
    	getButtons(leftPanel[1], "Button_2_1"),
    	getButtons(leftPanel[1], "Button_2_2")
	}

	leftButtons[2]={	
		getScorllViewButton(1,"Button_6"),
		getScorllViewButton(1,"Button_6_0"),
		getScorllViewButton(1,"Button_6_1"),
		getScorllViewButton(1,"Button_6_2"),
		getScorllViewButton(1,"Button_6_3"),
		getScorllViewButton(1,"Button_6_4"),
		getScorllViewButton(1,"Button_6_5"),
	}

	leftButtons[3]={	
		getScorllViewButton(2,"Button_7"),
		getScorllViewButton(2,"Button_7_0"),
		getScorllViewButton(2,"Button_7_1"),
		getScorllViewButton(2,"Button_7_2"),
		getScorllViewButton(2,"Button_7_3"),
	}

	leftButtons[4]={
    	getButtons(leftPanel[4], "Button_2_20"),
    	getButtons(leftPanel[4], "Button_2_0_22"),
    	getButtons(leftPanel[4], "Button_2_1_24"),
    	getButtons(leftPanel[4], "Button_2_2_26")
	}

    -- right buttons
    -- 右边下拉的按钮 （功能 ，商城 ，信息 ，系统 ）   暂时 功能 按钮 没有附属按钮， 点击会使 其他按钮的下属按钮消失
    rightButtons[2]={
		getScorllViewButton(3,"Button_7_36"),
		getScorllViewButton(3,"Button_7_0_38"),
		getScorllViewButton(3,"Button_7_1_40"),
		getScorllViewButton(3,"Button_7_2_42"),
		getScorllViewButton(3,"Button_7_3_44"),
	}

	rightButtons[3]={
		getScorllViewButton(4,"Button_7_36_46"),
		getScorllViewButton(4,"Button_7_0_38_48"),
		getScorllViewButton(4,"Button_7_1_40_50"),
		getScorllViewButton(4,"Button_7_2_42_52"),
		getScorllViewButton(4,"Button_7_3_44_54"),
	}

	rightButtons[4]={
		getScorllViewButton(5,"Button_7_36_56"),
		getScorllViewButton(5,"Button_7_0_38_58"),
		getScorllViewButton(5,"Button_7_1_40_60"),
		getScorllViewButton(5,"Button_7_2_42_62"),
		getScorllViewButton(5,"Button_7_3_44_64"),
	}



	local function leftAction()
    		if leftMainBut[1]:getPositionY() == 250 then
    			return
    		else
    			for i = 1,4 do   		
        			leftMainBut[i]:setPosition(leftMainBut[i]:getPositionX(), 140-90*i)
           			--local move=cc.EaseElasticInOut:create(cc.MoveTo:create(0.4,cc.p(leftMainBut[i]:getPositionX(),250)))
           			local move=cc.EaseElasticInOut:create(cc.MoveBy:create(0.4,cc.p(0,110+90*i)))       			
           			leftMainBut[i]:runAction(cc.Sequence:create(cc.DelayTime:create(0.1*i),move,cc.Place:create(cc.p(leftMainBut[i]:getPositionX(), 250)))) 
    			end
    		end
    		
    	end 
    	-- right display
    	local function rightAction()
    		if rightMainBut[1]:getPositionY() == 250 then
    			return
    		else
    			for i = 1,4 do    		
	 	      		rightMainBut[i]:setPosition(rightMainBut[i]:getPositionX(), 140-90*i)
	           		--local move=cc.EaseElasticInOut:create(cc.MoveTo:create(0.4,cc.p(rightMainBut[i]:getPositionX(),250)))
	           		local move=cc.EaseElasticInOut:create(cc.MoveBy:create(0.4,cc.p(0,110+90*i)))
           			rightMainBut[i]:runAction(cc.Sequence:create(cc.DelayTime:create(0.1*i),move,cc.Place:create(cc.p(rightMainBut[i]:getPositionX(), 250)))) 
    			end
    		end
    		
    	end
    -- left down 
    local  function leftDownAction()
    	for i = 4,1, -1 do      		
    		leftMainBut[i]:setPosition(leftMainBut[i]:getPositionX(), 250)
       		--local move=cc.EaseElasticInOut:create(cc.MoveTo:create(0.5,cc.p(leftMainBut[i]:getPositionX(),140-(90*i))))
       		local move=cc.EaseElasticInOut:create(cc.MoveBy:create(0.4,cc.p(0,-110-(90*i))))

       		leftMainBut[i]:runAction(cc.Sequence:create(cc.DelayTime:create(0.1*(4-i)),move,
       			cc.Place:create(cc.p(leftMainBut[i]:getPositionX(), 140-90*i)))) 

    		end
    end
    -- right down 
    local function rightDownAction()
    	for i = 4,1, -1 do
		
			rightMainBut[i]:setPosition(rightMainBut[i]:getPositionX(), 250)
	   		--local move=cc.EaseElasticInOut:create(cc.MoveTo:create(0.5,cc.p(rightMainBut[i]:getPositionX(),140-(90*i))))
	   		local move=cc.EaseElasticInOut:create(cc.MoveBy:create(0.4,cc.p(0,-110-(90*i))))

	   		rightMainBut[i]:runAction(cc.Sequence:create(cc.DelayTime:create(0.1*(4-i)),move,cc.Place:create(cc.p(rightMainBut[i]:getPositionX(), 140-90*i))))
      		--rightMainBut[i]:setPosition(rightMainBut[i]:getPositionX(), 140-90*i)

		end
    end
    	-- diaplay all buttons 
    	local function displayALL()
    		for i=1,4  do
	        	leftPanel[i]:setVisible(false)
    			if i >=2 then 
    				rightPanel[i]:setVisible(false)
    			end
    		end
    	end
	


	local function setAllButtonOrg()
		for i=1,4 do
        	leftMainBut[i]:setPosition(leftMainBut[i]:getPositionX(), 250)
 	      	rightMainBut[i]:setPosition(rightMainBut[i]:getPositionX(), 250)
			
		end
		MainCity.rightTouch=true
	   	MainCity.isTouch=true
	end
	local function touchCircleCallBack_left(ref,touchType)
		local butName=ref:getTag()
        if touchType==ccui.TouchEventType.began then
        	--MainCity.downBut:setTouchEnabled(true)
        elseif touchType == ccui.TouchEventType.ended then         	
			   	MainCity.downBut:setVisible(false)
   				MainCity.downBut:setPosition(-100,-100)
				--leftAction()
        		leftDownAction()

        elseif touchType == ccui.TouchEventType.canceled then

        end
	end

	local function touchCircleCallBack_right(ref,touchType)
		local butName=ref:getTag()
        if touchType==ccui.TouchEventType.began then

        elseif touchType == ccui.TouchEventType.ended then
		MainCity.downBut:setVisible(false)
   		MainCity.downBut:setPosition(-100,-100)
   		--rightAction()
    	rightDownAction()
		

        elseif touchType == ccui.TouchEventType.canceled then

        end
	end

	local function touchMainButCallBack(ref,touchType)
		local butName=ref:getName()
        if touchType==ccui.TouchEventType.began then

        elseif touchType == ccui.TouchEventType.ended then 
	        local function setPanelVisible( n )
	        	for i=1, 4 do

	        		if n == i then
	        			leftPanel[i]:setVisible(true)
	        		else
	        			leftPanel[i]:setVisible(false)

	        		end
	        	end
	        end
	        if "Button_1" == butName then
	        	setPanelVisible(1)
	        elseif "Button_1_0" == butName then
	        	setPanelVisible(2)	   			
	        elseif "Button_1_1" == butName then
	        	setPanelVisible(3)
	        elseif "Button_1_2" == butName then
	        	setPanelVisible(4)
	        end
	        Util.touchButton()
        elseif touchType == ccui.TouchEventType.canceled then

        end
	end

	local function showRightBUttons(ref,touchType)
		local butName=ref:getName()
        if touchType==ccui.TouchEventType.began then

        elseif touchType == ccui.TouchEventType.ended then 
	        local function setPanelVisible( n )
	        	for i=2, 4 do
	        		if n == i then
	        			rightPanel[i]:setVisible(true)
	        		else
	        			rightPanel[i]:setVisible(false)
	        		end
	        	end
	        end

	        if "Button_7" == butName then
	        	for i= 2,4 do
	        		rightPanel[i]:setVisible(false)	        		
	        	end
	        elseif "Button_7_0_0" == butName then
	        	setPanelVisible(2)	   			
	        elseif "Button_7_1_0" == butName then
	        	setPanelVisible(3)
	        elseif "Button_7_2_0" == butName then
	        	setPanelVisible(4)
	        end
	        Util.touchButton()
        elseif touchType == ccui.TouchEventType.canceled then

        end
	end
	local function touchLeftButCallBack(ref,touchType)
		local butName=ref:getName()
        if touchType==ccui.TouchEventType.began then

        elseif touchType == ccui.TouchEventType.ended then 
        

        elseif touchType == ccui.TouchEventType.canceled then

        end
	end

	local function touchRightButCallBack(ref,touchType)
		local butName=ref:getName()
        if touchType==ccui.TouchEventType.began then

        elseif touchType == ccui.TouchEventType.ended then 
        

        elseif touchType == ccui.TouchEventType.canceled then

        end
	end

	local function touchSystemButCallBack(ref,touchType)
		local butName=ref:getName()
        if touchType==ccui.TouchEventType.began then

        elseif touchType == ccui.TouchEventType.ended then 
           	displayALL()
       		--leftAction()
	   		--rightAction()
       		setAllButtonOrg()
	   		
	   		
        	if  "Button_2_2"== butName then 
      		    Util.removeCurrentLayer(MainCity.mMainLayer)
            	--Util.unload(MainCity.mMainLayer)
	            WorldMap.show()

            elseif  "Button_2"== butName then 
            	-- 暂时不用 功能在选关界面实现  24/12 
               --Server.hide()

        		--Util.removeCurrentLayer(MainCity.mMainLayer)
        		--Util.unload(MainCity.mMainLayer)

               --print("layers"..#layers)	               
                --for i=1, #layers do
                	  --cpp_log("release layers ")
               		--Util.unload(layers[i])
               --end
               --cpp_tobattleScene()
            elseif  "Button_2_1"== butName then  
              	--Server.hide()	               
        		Util.removeCurrentLayer(MainCity.mMainLayer)
        		--Util.unload(MainCity.mMainLayer)
            	RoleMsg.show()
           
            elseif  "Button_2_0"== butName then  
       			Util.removeCurrentLayer(MainCity.mMainLayer)	            	
    			Reward.load()
         		Reward.show()
    			
       		end
       		Util.touchButton()
        elseif touchType == ccui.TouchEventType.canceled then

        end
	end

	local function toSelectLevelLayer(ref,touchType)
		local butName=ref:getName()
        if touchType==ccui.TouchEventType.began then
	        Util.touchButton()

        elseif touchType == ccui.TouchEventType.ended then 
        	displayALL()
       		setAllButtonOrg()
            --Util.unload(MainCity.mMainLayer)
            if "Button_6" == butName then
	            	--MainCity.mMainLayer:release()
            	Util.removeCurrentLayer(MainCity.mMainLayer)

	       --  	if SelectLevel.mSelectLevelLayer:getParent() ~= nil then 
	    			-- print("SelectLevel.mSelectLevelLayer already  added  to scene!")
	       --  		return
	       --  	else
	       --  		SelectLevel.addToScene()
	    			-- print("SelectLevel.mSelectLevelLayer   add to  runningScene!")

	       --  	end

	            SelectLevel.show()
            elseif "Button_6_0"== butName   then 
            	if AudioEngine.isMusicPlaying () then -- 音乐正在播放  
        			AudioEngine.stopMusic()
      			else  
        			print("background music is not playing")  
      			end  
			    --AudioEngine.stopAllEffects() 
	           	
            	--后期调整 暂时组队界面 load 会导致内存增大一次，策划好了，再解决此问题
            	TeamLayer.load()
            	TeamLayer.show()
            	print("组队中。。。。。")

            -- 重力 接金币小游戏的主界面的入口	
            elseif "Button_6_3"== butName   then 
            	Util.removeCurrentLayer(MainCity.mMainLayer)
            	--GoldEndLayer.show()
            	GoldCoin.load()
            	GoldCoin.show()
            end
        	
        	
        elseif touchType == ccui.TouchEventType.canceled then

        end
	end

	for i=1,4 do
		leftMainBut[i]:addTouchEventListener(touchMainButCallBack)
		rightMainBut[i]:addTouchEventListener(showRightBUttons)
	end

	
	
	for i=1,#leftButtons[1] do
		--print("..................."..#leftButtons[1])
		leftButtons[1][i]:addTouchEventListener(touchSystemButCallBack)
	end

	leftButtons[2][1]:addTouchEventListener(toSelectLevelLayer)
	leftButtons[2][2]:setTouchEnabled(true)
	leftButtons[2][2]:addTouchEventListener(toSelectLevelLayer)
	leftButtons[2][5]:setTouchEnabled(true)
	leftButtons[2][5]:addTouchEventListener(toSelectLevelLayer)

	MainCity.downBut=ccui.Button:create("UI/Icon/circle3.png","UI/Icon/circle3.png")
   	MainCity.downBut:setPosition(-100,-100)
    MainCity.downBut:setVisible(false)

	MainCity.main_lay:addChild(MainCity.downBut,1000,Constants.DOWNBUTTON)


	local touchStart,touchEnd=nil,nil
	local function onTouchBegin(touch,event)
       	print("touch circle")
		touchStart=touch:getLocation()
        return true
    end
	-- local function onTouchMoved(touch,event)
    	   	        
 --    end

	local function onTouchEnded(touch,event)
	   	local touchPos=touch:getLocation()
	   	local glPoint=cc.Director:getInstance():convertToGL(touchPos)
	   	MainCity.downBut:setPosition(touchPos)
	   	print(touchPos.x)
	   	print(touchPos.y)

   		MainCity.downBut:setVisible(true)
   		--MainCity.downBut:runAction(cc.FadeIn:create(0))
    	MainCity.downBut:setTouchEnabled(true)
    	local absy=touchPos.y-touchStart.y
	   	if touchPos.x < Constants.WIDTH/2 then
	   		if  math.abs(absy) > 50  then
   				MainCity.downBut:setVisible(false)

	    		if absy > 0 then
	    			leftAction()
			   		MainCity.isTouch=true	    			
	    		else
	    			leftDownAction()
			   		MainCity.isTouch=false
	    		end
	    		print(absy)
	    		MainCity.downBut:runAction(cc.Sequence:create(cc.DelayTime:create(0),cc.CallFunc:create(function ()
   					MainCity.downBut:setVisible(false)  					
   				end)))
    		end
	   		if MainCity.isTouch then
	   			rightAction()	   			
				MainCity.downBut:addTouchEventListener(touchCircleCallBack_left)
		   		MainCity.isTouch=false
		   		print("下拉")
	   		else
	   			leftAction()
	   			rightAction()
		   		MainCity.isTouch=true
		   		MainCity.rightTouch=true
		   		print("收缩")
		   		MainCity.downBut:runAction(cc.Sequence:create(cc.DelayTime:create(1),cc.CallFunc:create(function ()
   					MainCity.downBut:setVisible(false)
   					
   				end)))

	   		end
	   			displayALL()

	   	else
	   		print("点击屏幕过半了")
	   		if  math.abs(absy)>50  then
   				MainCity.downBut:setVisible(false)
    		if absy > 0 then
    			rightAction()
		   		MainCity.rightTouch=true   			
    		else
    			rightDownAction()
		   		MainCity.rightTouch=false

    		end
    		print(absy)
    		MainCity.downBut:runAction(cc.Sequence:create(cc.DelayTime:create(0),cc.CallFunc:create(function ()
   					MainCity.downBut:setVisible(false)
   					
   				end)))
    	end

	   		if MainCity.rightTouch then
	   			leftAction()
				MainCity.downBut:addTouchEventListener(touchCircleCallBack_right)
			   	MainCity.rightTouch=false
			   		
	   		else
	   			--displayALL()
	   			leftAction()
				rightAction()
		   		MainCity.rightTouch=true
		   		MainCity.isTouch=true
   				MainCity.downBut:runAction(cc.Sequence:create(cc.DelayTime:create(1),cc.CallFunc:create(function ()
   					MainCity.downBut:setVisible(false)
   					
   				end)))
	   		end
	   			displayALL()
		end           

    end

    local listener=cc.EventListenerTouchOneByOne:create()
    listener:registerScriptHandler(onTouchBegin,cc.Handler.EVENT_TOUCH_BEGAN)
    --listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED)   
    listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED)
    local dispacher=cc.Director:getInstance():getEventDispatcher()
    dispacher:addEventListenerWithSceneGraphPriority(listener,MainCity.main_lay)


end

-- function MainCity.moveButtons()
-- 	local function onTouchBegin(touch,event)
       
--         return true
--     end

--     local function onTouchMoved(touch,event)
    
--      	local touchButton=event:getCurrentTarget()
-- 	    local touchPos=touch:getLocation()
-- 	    local size=touchButton:getContentSize()
-- 	    local glPoint=cc.Director:getInstance():convertToGL(touchPos)
-- 	    local pointX=touchButton:getPositionX()
-- 	    local pointY=touchButton:getPositionY()
-- 	    local rect=cc.rect(0,0,pointX,pointY)
	        
-- 		if touchButton == MainCity.downBut  then 
-- 			print("touch downBUtton") 			
--     		MainCity.panelRoot:setPosition(cc.p(MainCity.panelRoot:getPositionX()+touch:getDelta().x,MainCity.panelRoot:getPositionY()+touch:getDelta().y))
-- 		    if MainCity.panelRoot:getPositionX() >=0 and  MainCity.panelRoot:getPositionX() <= Constants.WIDTH-400 and 
-- 		    	 MainCity.panelRoot:getPositionY() >=0 and  MainCity.panelRoot:getPositionY() <= Constants.HEIGHT-400 then
--     			MainCity.panelRoot:setPosition(cc.p(MainCity.panelRoot:getPosition()))
-- 			else
-- 				if MainCity.panelRoot:getPositionX() <=0 then
--     				MainCity.panelRoot:setPositionX(0)

-- 				end

-- 				if MainCity.panelRoot:getPositionX() >=Constants.WIDTH-400 then
--     				MainCity.panelRoot:setPositionX(Constants.WIDTH-400)

-- 				end

-- 				if MainCity.panelRoot:getPositionY() <=0 then
--     				MainCity.panelRoot:setPositionY(0)

-- 				end

-- 				if MainCity.panelRoot:getPositionY() >=Constants.HEIGHT-400  then
--     				MainCity.panelRoot:setPositionY(Constants.HEIGHT-400)

-- 				end
-- 			end
		
-- 		end         
    	   	        
--     end

--     local function onTouchEnded(touch,event)
         
--     end

--     local listener=cc.EventListenerTouchOneByOne:create()
--     listener:registerScriptHandler(onTouchBegin,cc.Handler.EVENT_TOUCH_BEGAN)
--     listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED)
--     listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED)
--     local dispacher=cc.Director:getInstance():getEventDispatcher()
--     dispacher:addEventListenerWithSceneGraphPriority(listener,MainCity.downBut)
-- end

function MainCity.hide()
	if MainCity.mMainLayer:getParent() then
		MainCity.mMainLayer:getParent():removeChild(MainCity.mMainLayer, true)
	end
end
