package ru.barbuza.mapper {
import flash.utils.getDefinitionByName;

/**
 * @author Viktor Kotseruba <barbuzaster@gmail.com>
 */
function getVectorType(cls:Object):Class {
  var typename:String = Mapper.classDefinition(cls).attribute("name").toString();
  typename = typename.substring(21, typename.length - 1);
  if (typename == "*") {
    typename = "Object";
  }
  return getDefinitionByName(typename) as Class;
}
}
