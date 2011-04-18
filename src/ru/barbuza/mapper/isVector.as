package ru.barbuza.mapper {

/**
 * @author Viktor Kotseruba <barbuzaster@gmail.com>
 */
function isVector(cls:Object):Boolean {
  return Mapper.classDefinition(cls).attribute("name").toString().substring(0, 21) == "__AS3__.vec::Vector.<";
}
}
