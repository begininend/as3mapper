package ru.barbuza.mapper {
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;

/**
 * @author Viktor Kotseruba <barbuzaster@gmail.com>
 */
function mapVector(val:Array, to:Object):Object {
  var vectorClsName:String = getQualifiedClassName(Vector) + ".<" + getQualifiedClassName(to) + ">";
  var type:Class = getDefinitionByName(vectorClsName) as Class;
  var vec:Object = new type();
  for each (var item:Object in val) {
    vec.push(mapObject(item, to));
  }
  return vec;
}
}
