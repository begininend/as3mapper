package ru.barbuza.mapper {
import flash.utils.getDefinitionByName;

/**
 * @author Viktor Kotseruba <barbuzaster@gmail.com>
 */
function mapObject(val:Object, to:Object):Object {
  var result:*;
  if ([uint, int, Number, String, Array].indexOf(to) != -1) {
    return val as (to as Class);
  } else {
    result = new to();
    var type:Class;
    for each (var field:PublicField in getPublicFields(to)) {
      if (val.hasOwnProperty(field.name)) {
        if (field.type == "*") {
          result[field.name] = val[field.name];
        } else {
          type = getDefinitionByName(field.type) as Class;
          if (isVector(type)) {
            result[field.name] = mapVector(val[field.name], getVectorType(type));
          } else {
            result[field.name] = mapObject(val[field.name], type);
          }
        }
      }
    }
  }
  return result;
}
}
