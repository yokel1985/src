-- score  effect 
cc.exports.ScoreNumber={
	
}
-- pSender 父节点    px  py 跳数字的位置     num  得分  
function ScoreNumber.getScore(pSender,px,py,num)
	--让随机数更随机
    local myTime=os.time()
    local myt=string.reverse(myTime)   
    math.randomseed(myt)
	
	if 0==num then
		return 
	end

	if px == nil then px = 0 end
	if py == nil then py = 0 end

	local scaleRate=1.2
	local scoreLabel=nil
	local totalTime=0.5

	--scoreLabel = cc.Label:createWithCharMap("UI/Icon/score.png",38,48,49) --'-' ASC 48
	    scoreLabel=cc.Label:createWithTTF(" ","fonts/new1.ttf",30)      
    	--textLab:setPosition(cc.p(px,py))
        scoreLabel:setColor(cc.c4b(255,215,0,255))
		--label:setString(""..number*-1) 
		scoreLabel:setString(tostring(num)) 
		scoreLabel:setPosition(cc.p(px,py))
		scoreLabel:enableShadow(cc.c4b(23, 244, 123, 255))
		--scoreLabel:enableGlow(cc.c4b(23,234,123,245))

		pSender:addChild(scoreLabel,1000)
	local jump = cc.MoveBy:create(totalTime, cc.p(math.random(0,20), math.random(80, 100)))
	local scale = cc.ScaleBy:create(totalTime, scaleRate)
	--local scale = cc.Sequence:create(cc.ScaleBy:create(totaltime/2, scaleRate),cc.ScaleBy:create(totaltime/2, 1/scaleRate))
	--local js=cc.EaseInOut:create(cc.Spawn:create(jump,scale),2)
	local js=cc.Spawn:create(jump,scale)

	local seq=cc.Sequence:create(cc.CallFunc:create(function()
									 
									if scoreLabel then scoreLabel:runAction(cc.Spawn:create(cc.MoveBy:create(0.3,cc.p(0,60)),cc.FadeOut:create(0.4))) end
									 
	        					 end),
								 cc.DelayTime:create(0.5),
								 cc.CallFunc:create(function()     
									 pSender:removeChild(scoreLabel)
								 end))

	scoreLabel:runAction(cc.Sequence:create(js,seq))


end
return ScoreNumber

