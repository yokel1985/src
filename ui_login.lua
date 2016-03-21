-- 注册 选服界面
cc.exports.Login={
    mLoginLayer＝nil,
  	login_lay=nil,
  	serverName=nil,
  	enterBut=nil,
    registerBut=nil,
    settingBut=nil,
    serverBut=nil,
}

function Login.load()
  	Login.mLoginLayer=cc.Layer:create()
   	Login.login_lay = cc.CSLoader:createNode("UI/allcsd/Login.csb")

  	Login.mLoginLayer:retain()
  	Login.login_lay:setOpacity(0)
  	Login.login_lay:setTag(1)


  	Login.mLoginLayer:addChild(Login.login_lay)
    Login.mLoginLayer:addChild(goToBattleBut)
  	return Login.mLoginLayer
end

function Login.show()
  	Util.addCurrentScene(Login.mLoginLayer)
    Util.layerToOther(Login.login_lay )
    local s=cc.Director:getInstance():getVisibleSize()
    --AudioEngine.playMusic("sound/login.mp3", true) -- 播放音乐  
    -- if cc.SimpleAudioEngine:getInstance():isMusicPlaying() then
        cc.SimpleAudioEngine:getInstance():stopMusic()
        cc.SimpleAudioEngine:getInstance():playMusic(Constants.SOUND[4],true)
        
    --end



    Login.enterBut=Login.login_lay:getChildByName("startGame")
    Login.registerBut=Login.login_lay:getChildByName("register")  
    Login.settingBut=Login.login_lay:getChildByName("setting") 
    Login.serverBut=Login.login_lay:getChildByName("apple")  

    local severText=Login.enterBut:getChildByName("Text_1")
    local startText=Login.registerBut:getChildByName("Text_2")
    local registerText=Login.serverBut:getChildByName("Text_3")
    local setTouch=true

  	local function toServerLayer(ref,touchType)
        local buttonName = ref:getName()
        local registerLabel=cc.Label:createWithTTF("","fonts/new1.ttf",25)      
                registerLabel:setPosition(cc.p(875,600))
                Login.login_lay:addChild(registerLabel,100,1000)
        if touchType==ccui.TouchEventType.began then
                if "register"== buttonName then
                    local textLab=cc.Label:createWithTTF("账号管理暂时未开通。","fonts/new1.ttf",25)      
                    textLab:setPosition(cc.p(875,600))
                    Login.login_lay:addChild(textLab,100,1000)
                    textLab:runAction(cc.Sequence:create(cc.DelayTime:create(1),cc.RemoveSelf:create(true)))
                    --Login.registerBut:setTouchEnabled(true)
                end
        elseif touchType == ccui.TouchEventType.ended  then
            if "startGame"== buttonName then

                --Login.hide()
                Util.removeCurrentLayer(Login.mLoginLayer)
                MainCity.show()
            elseif "register"== buttonName then
                --Login.registerBut:setTouchEnabled(false)

                
                registerLabel:setString("账号管理暂时未开通。")
                
                registerLabel:runAction(cc.Sequence:create(cc.DelayTime:create(1),cc.RemoveSelf:create(true)))
            elseif "setting"== buttonName then
                if setTouch then
                    severText:setVisible(false)
                    startText:setVisible(false)
                    registerText:setVisible(false)
                    Login.settingBut:setOpacity(0)
                    setTouch=false
                else
                    severText:setVisible(true)
                    startText:setVisible(true)
                    registerText:setVisible(true)
                    Login.settingBut:setOpacity(255)
                    setTouch=true
                end
                

            end
            Util.touchButton()
        elseif touchType == ccui.TouchEventType.canceled then
           
        end
  	end
  	 

  	Login.enterBut:addTouchEventListener(toServerLayer)
    Login.registerBut:addTouchEventListener(toServerLayer)
    Login.settingBut:addTouchEventListener(toServerLayer)

    -- button action
    local moveButton=cc.MoveBy:create(12,cc.p(math.random(-50,50),math.random(-20,20)))
    local moveButton1=cc.MoveBy:create(10,cc.p(math.random(-50,50),math.random(-20,20)))
    local moveButton2=cc.MoveBy:create(15,cc.p(math.random(-50,50),math.random(-20,20)))

    Login.enterBut:runAction(cc.RepeatForever:create(cc.Sequence:create(moveButton,moveButton:reverse())))
    Login.registerBut:runAction(cc.RepeatForever:create(cc.Sequence:create(moveButton1,moveButton1:reverse())))
    --Login.serverBut:runAction(cc.RepeatForever:create(cc.Sequence:create(moveButton2,moveButton2:reverse())))
	
    -- background  clound action 
    local clound={}
    local move={}
    for i=1,6  do
        clound[i]=Login.login_lay:getChildByName("clound_"..i) 
        if i <= 4 then
            move[i]=cc.MoveBy:create(50+((-2)^(i%2)),cc.p(math.random(-150,40),math.random(0,100)))
            
        end

    end
    for i=1,#clound-2 do
        clound[i]:runAction(cc.RepeatForever:create(cc.Sequence:create(move[i],move[i]:reverse())))

    end
    local moveAction=cc.MoveTo:create(200,cc.p(Constants.WIDTH+clound[5]:getContentSize().width/2,clound[5]:getPositionY()))
    local placeActon=cc.Place:create(cc.p(-clound[5]:getContentSize().width/2,clound[5]:getPositionY()))
    local moveAction6=cc.MoveTo:create(160,cc.p(Constants.WIDTH+clound[6]:getContentSize().width/2,clound[6]:getPositionY()))
    local placeActon6=cc.Place:create(cc.p(-clound[6]:getContentSize().width/2,clound[6]:getPositionY()))
        clound[5]:runAction(cc.RepeatForever:create(cc.Sequence:create(moveAction,placeActon)))
        clound[6]:runAction(cc.RepeatForever:create(cc.Sequence:create(moveAction6,placeActon6)))
	

    -- select server 
  	local function menuCallbackConfig(sender)
  	--local tagq = sender:getTag()
      end
  	--local input=Login.login_lay:getChildByName("input")

    -- touch layer  selectServer display

  	local function onTouchBegin(touch,event)
         
          return true
    end

      -- local function onTouchMoved(touch,event)       
      -- end

    local function onTouchEnded(touch,event)
       	--Login.login_lay:getChildByName("server"):setVisible(false)
       	--Login.enterBut:setTouchEnabled(true)
         
    end

    local listener=cc.EventListenerTouchOneByOne:create()
    listener:registerScriptHandler(onTouchBegin,cc.Handler.EVENT_TOUCH_BEGAN)
    --listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED)
    listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED)
    local dispacher=cc.Director:getInstance():getEventDispatcher()
    dispacher:addEventListenerWithSceneGraphPriority(listener,Login.mLoginLayer)

  
        local isLook=true
        local getServerName=Login.login_lay:getChildByName("Panel_1"):getChildByName("ScrollView_1")
        local getAppleServer=Login.login_lay:getChildByName("Panel_2"):getChildByName("ScrollView_2")

        local serverTable={
            getServerName:getChildByName("common_1"),
            getServerName:getChildByName("common_2"),           
            getAppleServer:getChildByName("apple_1"),
            getAppleServer:getChildByName("apple_2"),

        }
        


        local function toSelectServer(ref,touchType)
            local butName=ref:getName()
            local textLab=cc.Label:createWithTTF("","fonts/new1.ttf",25)      
            textLab:setPosition(cc.p(195,600))
            Login.login_lay:addChild(textLab,100,1000)
            if touchType==ccui.TouchEventType.began then
                --Login.enterBut:setTouchEnabled(false)
            elseif touchType == ccui.TouchEventType.ended  then
                if "apple" == butName then
                    if isLook then
                        --cc.EaseBounceInOut 
                        --cc.EaseBackIn
                        local moveDown=cc.EaseBackIn:create(cc.MoveBy:create(0.2,cc.p(0,-400)))
                        Login.login_lay:getChildByName("Panel_1"):runAction(moveDown)
                        Login.login_lay:getChildByName("Panel_1"):setLocalZOrder(100)
                        local moveUp=cc.EaseBackIn:create(cc.MoveBy:create(0.2,cc.p(0,300)))

                        Login.login_lay:getChildByName("Panel_2"):runAction(moveUp)
                        Login.login_lay:getChildByName("Panel_2"):setLocalZOrder(100)

                        isLook = false
                    else
                        local moveDown1=cc.EaseBackIn:create(cc.MoveBy:create(0.2,cc.p(0,400)))

                        Login.login_lay:getChildByName("Panel_1"):runAction(moveDown1)
                        Login.login_lay:getChildByName("Panel_1"):setLocalZOrder(0)
                        local moveUp1=cc.EaseBackIn:create(cc.MoveBy:create(0.2,cc.p(0,-300)))

                        Login.login_lay:getChildByName("Panel_2"):runAction(moveUp1)
                        Login.login_lay:getChildByName("Panel_1"):setLocalZOrder(0)

                        isLook = true
                    end
                else
                    if "common_1" == butName then
                        textLab:setString(getServerName:getChildByName("common_1"):getTitleText())
                    elseif "common_2" == butName then
                        textLab:setString(getServerName:getChildByName("common_2"):getTitleText())

                    elseif "apple_1" == butName then
                        textLab:setString(getAppleServer:getChildByName("apple_1"):getTitleText())

                    elseif "apple_2" == butName then
                        textLab:setString(getAppleServer:getChildByName("apple_2"):getTitleText())

                    end
                    textLab:runAction(cc.Sequence:create(cc.DelayTime:create(1),cc.FadeOut:create(0.5),cc.RemoveSelf:create(true)))
                       
                end
            Util.touchButton()
               
            elseif touchType == ccui.TouchEventType.canceled then
               
            end

        end
        for i=1,#serverTable do

        serverTable[i]:addTouchEventListener(toSelectServer)
        end

        Login.serverBut:addTouchEventListener(toSelectServer)
        Login.serverBut:runAction(cc.RepeatForever:create(cc.Sequence:create(moveButton2,moveButton2:reverse())))

end

-- select server method

function Login.hide()
  	if Login.mLoginLayer:getParent() then
  		Login.mLoginLayer:getParent():removeChild(Login.mLoginLayer, true)
  	end
end