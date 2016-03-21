-- 关卡选择界面
cc.exports.SelectLevel={
	mSelectLevelLayer=nil,
	selectLevel_lay=nil,
}

function SelectLevel.load()
	SelectLevel.mSelectLevelLayer=cc.Layer:create()
   	SelectLevel.selectLevel_lay = cc.CSLoader:createNode("UI/allcsd/SelectLevel.csb")

  	SelectLevel.mSelectLevelLayer:retain()
  	SelectLevel.selectLevel_lay:setTag(1)
  	SelectLevel.mSelectLevelLayer:addChild(SelectLevel.selectLevel_lay)
  	return SelectLevel.mSelectLevelLayer
end
 function SelectLevel.addToScene()
	--Util.addCurrentScene(SelectLevel.mSelectLevelLayer)
    --Util.layerToOther(SelectLevel.selectLevel_lay)

 end
function SelectLevel.show()
	Util.addCurrentScene(SelectLevel.mSelectLevelLayer)
    Util.layerToOther(SelectLevel.selectLevel_lay)

    cc.SimpleAudioEngine:getInstance():stopMusic()
	cc.SimpleAudioEngine:getInstance():playMusic(Constants.SOUND[6],true)
    local levelButtons={}
    
    local layers={

		Login.mLoginLayer,
		RoleList.mRoleListLayer,
		WorldMap.mWorldMapLayer,
		RoleMsg.mRoleMsgLayer,
		--Reward.mRewardLayer,
		SelectLevel.mSelectLevelLayer,
		MainCity.mMainLayer,
		--TeamLayer.mTeamLayer,
		VictoryLayer.mVictoryLayer,
		GoldEndLayer.mGoldEndLayer,
	}
	local function toBattleCallBack(ref,touchType)
		local butName=ref:getName()
        if touchType==ccui.TouchEventType.began then
	        Util.touchButton()
        	
        elseif touchType == ccui.TouchEventType.ended then 
        	if  "Button_14" == butName then 
	    		Util.removeCurrentLayer(SelectLevel.mSelectLevelLayer)
                MainCity.show()       		
    		else
	    		Util.removeCurrentLayer(SelectLevel.mSelectLevelLayer)
	    		if AudioEngine.isMusicPlaying () then -- 音乐正在播放  
        			AudioEngine.stopMusic()
      			else  
        			print("background music is not playing")  
      			end  
			    AudioEngine.stopAllEffects() 
	           	print("layers"..#layers)	               
	            for i=1, #layers do
	            	--cpp_log("release layers ")
	           		Util.unload(layers[i])
	           	end
	           	
	           	cpp_tobattleScene()
	           	--VictoryLayer.show()
           end
           -- effect
        elseif touchType == ccui.TouchEventType.canceled then

        end
	end
	local function getButtons(n)
		local panelRoot=SelectLevel.selectLevel_lay:getChildByName("Panel_1")
		return ccui.Helper:seekWidgetByName(panelRoot, "Button_1_"..n)
	end
	for i=1,10 do
		levelButtons[i]=getButtons(i-1)
		levelButtons[i]:addTouchEventListener(toBattleCallBack)
	end
	
	

	local backMainBut=SelectLevel.selectLevel_lay:getChildByName("Button_14")

	backMainBut:addTouchEventListener(toBattleCallBack)
end

