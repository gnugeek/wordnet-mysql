-- MySQL dump 10.11
--
-- Host: localhost    Database: wordnet30
-- ------------------------------------------------------
-- Server version	5.0.38-Ubuntu_0ubuntu1-log
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,MYSQL323' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `wordnet30`
--

USE `wordnet30`;

--
-- Table structure for table `casedword`
--

DROP TABLE IF EXISTS `casedword`;
CREATE TABLE `casedword` (
  `wordid` decimal(6,0) NOT NULL default '0',
  `lemma` varchar(80) binary NOT NULL default '',
  PRIMARY KEY  (`wordid`)
) ;

--
-- Table structure for table `categorydef`
--

DROP TABLE IF EXISTS `categorydef`;
CREATE TABLE `categorydef` (
  `categoryid` decimal(2,0) NOT NULL default '0',
  `name` varchar(32) default NULL,
  `pos` enum('n','v','a','r','s') default NULL,
  PRIMARY KEY  (`categoryid`)
) ;

--
-- Table structure for table `framedef`
--

DROP TABLE IF EXISTS `framedef`;
CREATE TABLE `framedef` (
  `frameid` decimal(2,0) NOT NULL default '0',
  `frame` varchar(50) default NULL,
  PRIMARY KEY  (`frameid`)
) ;

--
-- Table structure for table `frameref`
--

DROP TABLE IF EXISTS `frameref`;
CREATE TABLE `frameref` (
  `synsetid` decimal(9,0) NOT NULL default '0',
  `wordid` decimal(6,0) NOT NULL default '0',
  `frameid` decimal(2,0) NOT NULL default '0',
  PRIMARY KEY  (`synsetid`,`wordid`,`frameid`)
) ;

--
-- Table structure for table `legacy2021`
--

DROP TABLE IF EXISTS `legacy2021`;
CREATE TABLE `legacy2021` (
  `mapid` decimal(6,0) NOT NULL,
  `synsetid` decimal(9,0) NOT NULL,
  `synsetid2` decimal(9,0) NOT NULL,
  `score` decimal(3,0) default NULL,
  PRIMARY KEY  (`mapid`)
) ;

--
-- Table structure for table `legacy2030`
--

DROP TABLE IF EXISTS `legacy2030`;
CREATE TABLE `legacy2030` (
  `mapid` decimal(6,0) NOT NULL,
  `synsetid` decimal(9,0) NOT NULL,
  `synsetid2` decimal(9,0) NOT NULL,
  `score` decimal(3,0) default NULL,
  PRIMARY KEY  (`mapid`)
) ;

--
-- Table structure for table `legacy2130`
--

DROP TABLE IF EXISTS `legacy2130`;
CREATE TABLE `legacy2130` (
  `mapid` decimal(6,0) NOT NULL,
  `synsetid` decimal(9,0) NOT NULL,
  `synsetid2` decimal(9,0) NOT NULL,
  `score` decimal(3,0) default NULL,
  PRIMARY KEY  (`mapid`)
) ;

--
-- Table structure for table `legacysensekey2021`
--

DROP TABLE IF EXISTS `legacysensekey2021`;
CREATE TABLE `legacysensekey2021` (
  `mapid` decimal(6,0) NOT NULL,
  `sensekey` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`mapid`,`sensekey`)
) ;

--
-- Table structure for table `legacysensekey2030`
--

DROP TABLE IF EXISTS `legacysensekey2030`;
CREATE TABLE `legacysensekey2030` (
  `mapid` decimal(6,0) NOT NULL,
  `sensekey` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`mapid`,`sensekey`)
) ;

--
-- Table structure for table `legacysensekey2130`
--

DROP TABLE IF EXISTS `legacysensekey2130`;
CREATE TABLE `legacysensekey2130` (
  `mapid` decimal(6,0) NOT NULL,
  `sensekey` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`mapid`,`sensekey`)
) ;

--
-- Table structure for table `lexlinkref`
--

DROP TABLE IF EXISTS `lexlinkref`;
CREATE TABLE `lexlinkref` (
  `synset1id` decimal(9,0) NOT NULL default '0',
  `word1id` decimal(6,0) NOT NULL default '0',
  `synset2id` decimal(9,0) NOT NULL default '0',
  `word2id` decimal(6,0) NOT NULL default '0',
  `linkid` decimal(2,0) NOT NULL default '0',
  PRIMARY KEY  (`word1id`,`synset1id`,`word2id`,`synset2id`,`linkid`)
) ;

--
-- Table structure for table `linkdef`
--

DROP TABLE IF EXISTS `linkdef`;
CREATE TABLE `linkdef` (
  `linkid` decimal(2,0) NOT NULL default '0',
  `name` varchar(50) default NULL,
  `recurses` enum('Y','N') NOT NULL default 'N',
  PRIMARY KEY  (`linkid`)
) ;

--
-- Table structure for table `morphdef`
--

DROP TABLE IF EXISTS `morphdef`;
CREATE TABLE `morphdef` (
  `morphid` decimal(6,0) NOT NULL default '0',
  `lemma` varchar(70) NOT NULL default '',
  PRIMARY KEY  (`morphid`)
) ;

--
-- Table structure for table `morphref`
--

DROP TABLE IF EXISTS `morphref`;
CREATE TABLE `morphref` (
  `wordid` decimal(6,0) NOT NULL default '0',
  `pos` enum('n','v','a','r','s') NOT NULL default 'n',
  `morphid` decimal(6,0) NOT NULL default '0',
  PRIMARY KEY  (`morphid`,`pos`,`wordid`)
) ;

--
-- Table structure for table `sample`
--

DROP TABLE IF EXISTS `sample`;
CREATE TABLE `sample` (
  `synsetid` decimal(9,0) NOT NULL default '0',
  `sampleid` decimal(2,0) NOT NULL default '0',
  `sample` mediumtext NOT NULL,
  PRIMARY KEY  (`synsetid`,`sampleid`)
) ;

--
-- Table structure for table `semlinkref`
--

DROP TABLE IF EXISTS `semlinkref`;
CREATE TABLE `semlinkref` (
  `synset1id` decimal(9,0) NOT NULL default '0',
  `synset2id` decimal(9,0) NOT NULL default '0',
  `linkid` decimal(2,0) NOT NULL default '0',
  PRIMARY KEY  (`synset1id`,`synset2id`,`linkid`)
) ;

--
-- Table structure for table `sense`
--

DROP TABLE IF EXISTS `sense`;
CREATE TABLE `sense` (
  `wordid` decimal(6,0) NOT NULL default '0',
  `casedwordid` decimal(6,0) default NULL,
  `synsetid` decimal(9,0) NOT NULL default '0',
  `rank` decimal(2,0) NOT NULL default '0',
  `lexid` decimal(2,0) NOT NULL default '0',
  `tagcount` decimal(5,0) default NULL,
  PRIMARY KEY  (`synsetid`,`wordid`)
) ;

--
-- Table structure for table `sentencedef`
--

DROP TABLE IF EXISTS `sentencedef`;
CREATE TABLE `sentencedef` (
  `sentenceid` decimal(3,0) NOT NULL default '0',
  `sentence` mediumtext,
  PRIMARY KEY  (`sentenceid`)
) ;

--
-- Table structure for table `sentenceref`
--

DROP TABLE IF EXISTS `sentenceref`;
CREATE TABLE `sentenceref` (
  `synsetid` decimal(9,0) NOT NULL default '0',
  `wordid` decimal(6,0) NOT NULL default '0',
  `sentenceid` decimal(3,0) NOT NULL default '0',
  PRIMARY KEY  (`synsetid`,`wordid`,`sentenceid`)
) ;

--
-- Table structure for table `synset`
--

DROP TABLE IF EXISTS `synset`;
CREATE TABLE `synset` (
  `synsetid` decimal(9,0) NOT NULL default '0',
  `pos` enum('n','v','a','r','s') default NULL,
  `categoryid` decimal(2,0) NOT NULL default '0',
  `definition` mediumtext,
  PRIMARY KEY  (`synsetid`)
) ;

--
-- Table structure for table `vnclass`
--

DROP TABLE IF EXISTS `vnclass`;
CREATE TABLE `vnclass` (
  `classid` decimal(3,0) NOT NULL,
  `class` varchar(64) NOT NULL,
  PRIMARY KEY  (`classid`)
) ;

--
-- Table structure for table `vnexampledef`
--

DROP TABLE IF EXISTS `vnexampledef`;
CREATE TABLE `vnexampledef` (
  `exampleid` decimal(4,0) NOT NULL,
  `example` varchar(128) NOT NULL,
  PRIMARY KEY  (`exampleid`)
) ;

--
-- Table structure for table `vnexampleref`
--

DROP TABLE IF EXISTS `vnexampleref`;
CREATE TABLE `vnexampleref` (
  `frameid` decimal(5,0) NOT NULL,
  `exampleid` decimal(4,0) NOT NULL,
  PRIMARY KEY  (`frameid`,`exampleid`)
) ;

--
-- Table structure for table `vnframedef`
--

DROP TABLE IF EXISTS `vnframedef`;
CREATE TABLE `vnframedef` (
  `frameid` decimal(5,0) NOT NULL,
  `number` varchar(16) NOT NULL,
  `xtag` varchar(16) NOT NULL,
  `description1` varchar(64) NOT NULL,
  `description2` varchar(64) default NULL,
  `syntax` mediumtext NOT NULL,
  `semantics` mediumtext NOT NULL,
  PRIMARY KEY  (`frameid`)
) ;

--
-- Table structure for table `vnframeref`
--

DROP TABLE IF EXISTS `vnframeref`;
CREATE TABLE `vnframeref` (
  `framerefid` decimal(6,0) NOT NULL,
  `wordid` decimal(6,0) NOT NULL,
  `synsetid` decimal(9,0) default NULL,
  `frameid` decimal(5,0) NOT NULL,
  `classid` decimal(3,0) NOT NULL,
  `quality` int(2) default NULL,
  PRIMARY KEY  (`framerefid`)
) ;

--
-- Table structure for table `vnrole`
--

DROP TABLE IF EXISTS `vnrole`;
CREATE TABLE `vnrole` (
  `roleid` decimal(6,0) NOT NULL,
  `wordid` decimal(6,0) NOT NULL,
  `synsetid` decimal(9,0) default NULL,
  `classid` decimal(3,0) NOT NULL,
  `rolesetid` decimal(4,0) NOT NULL,
  `roletypeid` decimal(4,0) NOT NULL,
  `selrestrsid` decimal(2,0) NOT NULL,
  `quality` int(2) default NULL,
  PRIMARY KEY  (`roleid`)
) ;

--
-- Table structure for table `vnroletype`
--

DROP TABLE IF EXISTS `vnroletype`;
CREATE TABLE `vnroletype` (
  `roletypeid` decimal(3,0) NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY  (`roletypeid`)
) ;

--
-- Table structure for table `vnselrestr`
--

DROP TABLE IF EXISTS `vnselrestr`;
CREATE TABLE `vnselrestr` (
  `selrestrid` decimal(5,0) NOT NULL,
  `value` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY  (`selrestrid`)
) ;

--
-- Table structure for table `vnselrestrs`
--

DROP TABLE IF EXISTS `vnselrestrs`;
CREATE TABLE `vnselrestrs` (
  `selrestrsid` decimal(2,0) NOT NULL,
  `selrestrs` mediumtext,
  PRIMARY KEY  (`selrestrsid`)
) ;

--
-- Table structure for table `word`
--

DROP TABLE IF EXISTS `word`;
CREATE TABLE `word` (
  `wordid` decimal(6,0) NOT NULL default '0',
  `lemma` varchar(80) NOT NULL default '',
  PRIMARY KEY  (`wordid`)
) ;

--
-- Table structure for table `wordposition`
--

DROP TABLE IF EXISTS `wordposition`;
CREATE TABLE `wordposition` (
  `synsetid` decimal(9,0) NOT NULL default '0',
  `wordid` decimal(6,0) NOT NULL default '0',
  `positionid` enum('a','p','ip') NOT NULL default 'a',
  PRIMARY KEY  (`synsetid`,`wordid`)
) ;

--
-- Table structure for table `xwnparselft`
--

DROP TABLE IF EXISTS `xwnparselft`;
CREATE TABLE `xwnparselft` (
  `synsetid` decimal(9,0) NOT NULL,
  `parse` mediumtext NOT NULL,
  `lft` mediumtext NOT NULL,
  `parsequality` int(1) default NULL,
  `lftquality` int(1) default NULL
) ;

--
-- Table structure for table `xwnwsd`
--

DROP TABLE IF EXISTS `xwnwsd`;
CREATE TABLE `xwnwsd` (
  `synsetid` decimal(9,0) NOT NULL,
  `wsd` mediumtext NOT NULL,
  `text` mediumtext
) ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2007-05-12 20:44:34
