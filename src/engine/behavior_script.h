#ifndef _BEHAVIOR_SCRIPT_H_
#define _BEHAVIOR_SCRIPT_H_

#define BEH_BREAK    1
#define BEH_CONTINUE 0

#define cur_object_get_int(offset) gCurrentObject->OBJECT_FIELD_S32(offset)
#define cur_object_get_float(offset) gCurrentObject->OBJECT_FIELD_F32(offset)

#define cur_object_add_float(offset, value) gCurrentObject->OBJECT_FIELD_F32(offset) += (f32)(value)
#define cur_object_set_float(offset, value) gCurrentObject->OBJECT_FIELD_F32(offset) = (f32)(value)
#define cur_object_add_int(offset, value) gCurrentObject->OBJECT_FIELD_S32(offset) += (s32)(value)
#define cur_object_set_int(offset, value) gCurrentObject->OBJECT_FIELD_S32(offset) = (s32)(value)
#define cur_object_or_int(offset, value)  gCurrentObject->OBJECT_FIELD_S32(offset) |= (s32)(value)
#define cur_object_and_int(offset, value) gCurrentObject->OBJECT_FIELD_S32(offset) &= (s32)(value)
#define cur_object_set_vptr(offset, value) gCurrentObject->OBJECT_FIELD_VPTR(offset) = (void *)(value)

#define object_and_int(object, offset, value) object->OBJECT_FIELD_S32(offset) &= (s32)(value)

u16 RandomU16(void);
float RandomFloat(void);
s32 RandomSign(void);

void func_80383D68(struct Object *object);

void stub_80385BF0(void);

void cur_object_exec_behavior(void);

#endif /* _BEHAVIOR_SCRIPT_H_ */
