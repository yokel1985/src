--  data manager

cc.exports.Util={
	scene=nil,
	sound = {}
}
Util.sound ={
	"sound/login.mp3",
	"sound/main.mp3",
}
-- touch  button effect
function Util.touchButton()
	 AudioEngine.playEffect("sound/click.mp3")
end
function Util.load()
	Util.scene = cc.Scene:create()
    cc.Director:getInstance():runWithScene(Util.scene)
	
end
function Util.addNewLayer()
	-- Util.scene = cc.Scene:create()
 --    cc.Director:getInstance():replaceScene(Util.scene)
    --local layer =Loading.mLoadingLayer
    --Util.scene:addChild(layer)
end
function Util.backLua(newLayer)
	local scene = cc.Scene:create()
    cc.Director:getInstance():replaceScene(scene)
	print("ui_util------- scene  is new scene! ")	
    scene:addChild(newLayer)
end
function Util.addCurrentScene(newLayer)
	local scene=cc.Director:getInstance():getRunningScene()
	if scene~=nil then
		if newLayer:getParent() ~=nil then
			newLayer:getParent():removeChild(newLayer, true)
			scene:addChild(newLayer)			
		else
			scene:addChild(newLayer)
		end
	else 
		--Util.backLua(newLayer)
	   	Util.load()
    	Util.scene:addChild(newLayer)
	   	print("ui_util------- scene  is  nil ")	
    	--Util.scene:addChild(newLayer)

	   --Util.load()
	end
end

function Util.unload(layerName)
	
	if layerName ~=nil then
		if layerName:getParent() ~=nil then
			layerName:getParent():removeChild(layerName, true)			
		else
			print("This layer's parent is nil")
		end
	layerName:release()
	print("release  layers")
	else 
		print(".......This layer is nil.........")	
		return
	end

end

-- delete current layer
function Util.removeCurrentLayer(layerName)
	layerName:getChildByTag(1):runAction(cc.Sequence:create(cc.DelayTime:create(0.01),cc.FadeOut:create(0.1),cc.CallFunc:create(
        function ()
            layerName:getParent():removeChild(layerName,true)
            --layerName:removeFromParent()
        end)))
	
end
-- switch to other layer
function Util.layerToOther(layerName)
	if layerName then
		layerName:runAction(cc.Sequence:create(cc.DelayTime:create(0.2),cc.FadeIn:create(0.4)))
	else
		print("this layer is nil !")
		return 
	end
end
