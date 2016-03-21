--后期统一一下文字格式和数值格式 
--用于后期金币之类的大数据转换成相应的 K ,M, B , KB, MB, BB,最多显示两位小数
local UnitConSprite ={}
--文字直接用
function UnitConSprite:strToTTF(sender,str,px,py,fontSize)
    --nn=nil or 10000
	local textLab=cc.Label:createWithTTF(str,"fonts/W5.ttf",fontSize)      
    	textLab:setPosition(cc.p(px,py))
        sender:addChild(textLab,100,1000)
end
--数据需要转换下就可以了 , 数值用这个函数转换    只是显示数据，真实数据还是用不转换的存储。这样减少误差
function UnitConSprite:converterValue(sender,num,px,py,fontSize)
	local function numConverter(num)
        local numToStr, count=nil,0 
        while num>=1000 do
        	num=num/1000
        	count=count+1    	
        end
        numToStr=num
         --四舍五入的函数   
         -- print("num="..num-num%0.01)  直接获取保留两位小数点的值
        local function roundNum(num)
        	local number=num*1000%10
        	if number>=5 then
        	    num=num*1000+10
        	else
        		num=num*1000
        	end
        	return (math.floor(num/10)/100)
        end
        if 1==count then          
        numToStr=tostring(roundNum(numToStr).."K") 
        elseif 2==count then
        	numToStr=tostring(roundNum(numToStr).."M")
        elseif 3==count then
			numToStr=tostring(roundNum(numToStr).."B")
        elseif 4==count then
			numToStr=tostring(roundNum(numToStr).."KB")
        elseif 5==count then
			numToStr=tostring(roundNum(numToStr).."MB")
        elseif 6==count then
			numToStr=tostring(roundNum(numToStr).."BB")
		else
			numToStr=tostring(num)
        end
		return numToStr
	end
       
    
    local str=numConverter(num)
    self:strToTTF(sender,str,px,py,fontSize)
end

return UnitConSprite


