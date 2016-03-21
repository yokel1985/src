cc.exports.mCppToLua = {}

function cc.exports.cpptolua(a)
    
    print("成功成功hahhaahah")
    cc.exports.preload_res={   
        --SelectLevel.load
    }

    for i=1,#preload_res do
        print("load scb"..i)    
        
        preload_res[i]() 
    end

	--Util.backLua(VictoryLayer.mVictoryLayer)
 print("lua luaoc.callStaticMethod")
    --VictoryLayer.show()
end



