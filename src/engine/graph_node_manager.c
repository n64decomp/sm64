#include <ultra64.h>
#include "sm64.h"

#include "game/level_update.h"
#include "math_util.h"
#include "game/memory.h"
#include "graph_node.h"
#include "game/rendering_graph_node.h"
#include "game/area.h"
#include "geo_layout.h"

/**
 * Takes a pointer to three shorts (supplied by a geo layout script) and
 * copies it to the destination float vector.
 */
s16 *read_vec3s_to_vec3f(Vec3f dst, s16 *src) {
    dst[0] = *src++;
    dst[1] = *src++;
    dst[2] = *src++;
    return src;
}

/**
 * Takes a pointer to three shorts (supplied by a geo layout script) and
 * copies it to the destination vector. It's essentially a memcpy but consistent
 * with the other two 'geo-script vector to internal vector' functions.
 */
s16 *read_vec3s(Vec3s dst, s16 *src) {
    dst[0] = *src++;
    dst[1] = *src++;
    dst[2] = *src++;
    return src;
}

/**
 * Takes a pointer to three angles in degrees (supplied by a geo layout script)
 * and converts it to a vector of three in-game angle units in [-32768, 32767]
 * range.
 */
s16 *read_vec3s_angle(Vec3s dst, s16 *src) {
    dst[0] = ((*src++) << 15) / 180;
    dst[1] = ((*src++) << 15) / 180;
    dst[2] = ((*src++) << 15) / 180;
    return src;
}

/**
 * Add the given graph node as a child to the current top of the gfx stack:
 * 'gCurGraphNodeList'. This is called from geo_layout commands to add nodes
 * to the scene graph.
 */
void register_scene_graph_node(struct GraphNode *graphNode) {
    if (graphNode != NULL) {
        gCurGraphNodeList[gCurGraphNodeIndex] = graphNode;

        if (gCurGraphNodeIndex == 0) {
            if (gCurRootGraphNode == NULL) {
                gCurRootGraphNode = graphNode;
            }
        } else {
            if (gCurGraphNodeList[gCurGraphNodeIndex - 1]->type == GRAPH_NODE_TYPE_OBJECT_PARENT) {
                ((struct GraphNodeObjectParent *) gCurGraphNodeList[gCurGraphNodeIndex - 1])
                    ->sharedChild = graphNode;
            } else {
                geo_add_child(gCurGraphNodeList[gCurGraphNodeIndex - 1], graphNode);
            }
        }
    }
}
