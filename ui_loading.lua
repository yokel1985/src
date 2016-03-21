
cc.exports.Loading = {
    mLoadingLayer = nil,
    loading_Lay=nil,   
    updatePro=nil,  
    tbl = {} 
}
Loading.tbl = {name = "shun", id = 20114442} 
function Loading.load()
    Util.load()
	Loading.mLoadingLayer = cc.Layer:create()
	Loading.loading_Lay = cc.CSLoader:createNode("UI/allcsd/LoadingLayer.csb")
    --Loading.mLoadingLayer:retain()  
    Loading.loading_Lay:setTag(1)
    local function touchEvent(sender,eventType)
        if eventType == ccui.TouchEventType.began then
            
            local num,str = cpp_getXMLData(12,155,12,22,200,"tr ");
            print("c++ return value "..num)
            print(str)
            
            print("Touch Down")

        elseif eventType == ccui.TouchEventType.moved then
            print("Touch Move")
        elseif eventType == ccui.TouchEventType.ended then
            print("Touch Up")
            cpp_tobattleScene()
            
        elseif eventType == ccui.TouchEventType.canceled then
            print("Touch Cancelled")
        end
    end

    local goToBattleBut = ccui.Button:create()
        goToBattleBut:setTouchEnabled(true)
        goToBattleBut:loadTextures("huoyanqiu11.png", "huoyanqiu22.png", "")
        goToBattleBut:setPosition(cc.p(Constants.WIDTH / 2.0, Constants.HEIGHT / 3.0))
        goToBattleBut:addTouchEventListener(touchEvent)

    Loading.mLoadingLayer:addChild(goToBattleBut,2)
    Loading.mLoadingLayer:addChild(Loading.loading_Lay)
    return Loading.mLoadingLayer

end

function Loading.show()
    -- loading every UI           
    Loading.preload_res={

    }
    Util.addCurrentScene(Loading.mLoadingLayer)
    --print("加载资源的长度".. #Loading.preload_res)
    local lenRes = math.ceil(100/table.maxn(Loading.preload_res))
    local kk=1
    local function update(dt)
        --Loading.loadRes()
        --Server.load()          
    	count=count+8
        if kk <= #Loading.preload_res then
            Loading.preload_res[kk]()
        end
        --for i=1,#Constants.SOUND do
        if kk <=#Constants.SOUND then

            cc.SimpleAudioEngine:getInstance():preloadMusic(Constants.SOUND[kk])
        end
        --print("加载资源的次数".. 100/lenRes)
        if count>=100 then
            cc.Director:getInstance():getScheduler():unscheduleScriptEntry(Loading.updatePro)          
            Util.removeCurrentLayer(Loading.mLoadingLayer)
            
            Login.show()
            
        end
        if count >= 100 then
            count = 100
        end
		label:setString(tostring(count).."%")
        kk = kk+1
    end

	--Loading.updatePro=cc.Director:getInstance():getScheduler():scheduleScriptFunc(update,0.1, false)
end 


function Loading.hide()

	if Loading.mLoadingLayer:getParent() then
		Loading.mLoadingLayer:getParent():removeChild(Loading.mLoadingLayer)        
	end
end

function Loading.addNewLayer(layerName)
    cc.Director:getInstance():getRunningScene():addChild(layerName)
end

return Loading 

