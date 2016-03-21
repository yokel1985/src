cc.exports.RequrieFile = {

}
-- 多层切换管理类
--cc.LayerMultiplex:create():switchTo(n)

function cc.exports.RequrieFile.load()
    
    require "loadData"
    require "ui_loading"
    require "ui_util"
    require "constants"
    require "cppToLua"


end
function cc.exports.RequrieFile.show()
    LoadData.load()
    
end

