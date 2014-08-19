<?php

/**
 * Generated by PHPUnit_SkeletonGenerator 1.2.0 on 2013-02-10 at 16:36:42.
 */
class RoteTest extends PHPUnit_Framework_TestCase
{

	/**
	 * @var Route
	 */
	protected $object;

	/**
	 * Sets up the fixture, for example, opens a network connection.
	 * This method is called before a test is executed.
	 */
	protected function setUp()
	{
		$this->object = new \PHPixie\Route('url', '(/<controller>(/<action>(/<id>)))', array(
			'controller' => 'home',
			'action' => 'index'
		),'test');
	}

	/**
	 * Tears down the fixture, for example, closes a network connection.
	 * This method is called after a test is executed.
	 */
	protected function tearDown()
	{

	}

	public function testUrl()
	{

		$this->assertEquals('/home/index/5', $this->object->url(array('id' => 5)));
		$this->assertEquals('/home/index', $this->object->url());
		$this->assertEquals('TEST', $this->object->methods[0]);
	}

}