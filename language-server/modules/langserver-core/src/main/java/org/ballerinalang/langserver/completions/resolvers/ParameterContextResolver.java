/*
*  Copyright (c) 2017, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
*
*  WSO2 Inc. licenses this file to you under the Apache License,
*  Version 2.0 (the "License"); you may not use this file except
*  in compliance with the License.
*  You may obtain a copy of the License at
*
*    http://www.apache.org/licenses/LICENSE-2.0
*
*  Unless required by applicable law or agreed to in writing,
*  software distributed under the License is distributed on an
*  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
*  KIND, either express or implied.  See the License for the
*  specific language governing permissions and limitations
*  under the License.
*/

package org.ballerinalang.langserver.completions.resolvers;

import org.ballerinalang.langserver.compiler.LSContext;
import org.ballerinalang.langserver.completions.CompletionKeys;
import org.eclipse.lsp4j.CompletionItem;

import java.util.List;

/**
 * Parameter context resolver for resolving the items of the parameter context.
 */
public class ParameterContextResolver extends AbstractItemResolver {
    @Override
    public List<CompletionItem> resolveItems(LSContext completionContext) {
        return this.getBasicTypes(completionContext.get(CompletionKeys.VISIBLE_SYMBOLS_KEY));
    }
}
