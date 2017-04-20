#import <Realm/Realm.h>

@interface AreaForDataEntity : RLMObject

/**
* 地区名称
*/
@property NSString *Name;
/**
* 地区父级编号
*/
@property int ParentID;
/**
* 地区缩写
*/
@property NSString *ShortName;
/**
* 地区代码
*/
@property NSString *CityCode;
/**
* 版本号
*/
@property long VersionNo;
/**
* 是否启用
*/
@property BOOL IsEnable;
/**
* 编号
*/
@property int ID;
/**
* 邮政编码
*/
@property NSString *ZipCode;
/**
* 全名路径
*/
@property NSString *MergerName;
/**
* 经度
*/
@property double Lng;
/**
* 纬度
*/
@property double Lat;
/**
* 拼音
*/
@property NSString *Pinyin;
@end
RLM_ARRAY_TYPE(AreaForDataEntity)
