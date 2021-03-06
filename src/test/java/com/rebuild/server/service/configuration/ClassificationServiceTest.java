/*
rebuild - Building your business-systems freely.
Copyright (C) 2019 devezhao <zhaofang123@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <https://www.gnu.org/licenses/>.
*/

package com.rebuild.server.service.configuration;

import cn.devezhao.persist4j.engine.ID;
import com.rebuild.server.Application;
import com.rebuild.server.TestSupport;
import org.junit.Test;
import org.springframework.util.StopWatch;

/**
 * @author devezhao-mbp zhaofang123@gmail.com
 * @since 2019/04/10
 */
public class ClassificationServiceTest extends TestSupport {

	@Test
	public void testReindexFullName() throws Exception {
		StopWatch stopWatch = new StopWatch();
		stopWatch.start("REINDEX FULLNAME");
		
		ID itemId = ID.valueOf("019-016a07d47aea0076");
		int reindex = Application.getBean(ClassificationService.class).reindexFullNameByParent(itemId, ID.valueOf("018-0000000000000001"));
		stopWatch.stop();
		System.out.println("REINDEX : " + reindex);
		System.out.println(stopWatch.prettyPrint());
	}
	
}
