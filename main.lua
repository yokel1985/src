UIMenu = {
}
cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")

require "config"
require "cocos.init"
require "requrieFile"


local function main()
	cc.Director:getInstance():setDisplayStats (CC_SHOW_FPS)
    cc.exports.RequrieFile.load()
    cc.exports.RequrieFile.show()
	--cpp_tobattleScene()
    -- go to battle 
    -- cpp_tobattleScene()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
 